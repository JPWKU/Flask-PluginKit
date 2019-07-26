# -*- coding: utf-8 -*-
"""
    flask_pluginkit._web
    ~~~~~~~~~~~~~~~~~~~~

    The server-side plugin management blueprint.

    :copyright: (c) 2019 by staugur.
    :license: BSD 3-Clause, see LICENSE for more details.
"""

from time import sleep
from flask import Blueprint, current_app, g, request, jsonify,\
    render_template, make_response, Response
from .utils import PY2

if PY2:
    import thread
else:
    import _thread as thread

#: Blueprint instance for managing plugins
#:
#: ..versionadded:: 3.3.0
blueprint = Blueprint('flask_pluginkit', 'flask_pluginkit',
                      template_folder='templates', static_folder='static')


def _get_conf(config_name):
    return current_app.config.get(config_name)


@blueprint.before_request
def pluginkit_auth():
    """You must have validation to access this page."""
    authMethod = _get_conf("PLUGINKIT_AUTH_METHOD")
    authAidMethod = _get_conf("PLUGINKIT_AUTH_AID_METHOD")
    authResult = dict(msg="Unverified", code=1, method=authMethod)

    def authTipmsg(authResult, code=403):
        return "%s Authentication failed [%s]: %s [%s]" % (
               code, authResult["method"], authResult["msg"],
               authResult["code"])

    if authMethod == "BOOL":
        AUTHBOOLFIELD = _get_conf("PLUGINKIT_AUTH_BOOLFIELD")
        if AUTHBOOLFIELD is True:
            authResult.update(code=0)
        else:
            if getattr(g, "signin", None) is True:
                authResult.update(code=0)

    elif authMethod == "BASIC":
        #: the realm parameter is reserved for defining protection spaces and
        #: it's used by the authentication schemes to indicate a scope of
        #: protection.
        AUTHREALM = _get_conf("PLUGINKIT_AUTH_REALM") or \
            "Flask-PluginKit Login Required"

        #: User and password configuration, format {user:pass, user:pass},
        #: if format error, all authentication failure by default.
        AUTHUSERS = _get_conf("PLUGINKIT_AUTH_USERS")

        def verify_auth(username, password):
            """Check the user and password"""
            if isinstance(AUTHUSERS, dict) and username in AUTHUSERS:
                return password == AUTHUSERS[username]
            return False

        def not_authenticated():
            """Sends a 401 response that enables basic auth"""
            return Response(authTipmsg(authResult, 401), 401,
                            {'WWW-Authenticate': 'Basic realm="%s"' %
                             AUTHREALM})

        #: Intercepts authentication and denies access if it fails
        auth = request.authorization
        if not auth or not verify_auth(auth.username, auth.password):
            authResult.update(msg="Invalid username or password")
            return not_authenticated()
        else:
            authResult.update(code=0)

    elif authMethod == "TOKEN":
        AUTHTOKEN = _get_conf("PLUGINKIT_AUTH_TOKENFIELD") or \
            "AccessToken"
        AUTHCHECKTOKEN = _get_conf("PLUGINKIT_AUTH_CHECKTOKEN")
        if AUTHTOKEN and callable(AUTHCHECKTOKEN):
            ak = request.headers.get(AUTHTOKEN)
            if ak and AUTHCHECKTOKEN(ak):
                authResult.update(code=0)

    elif authMethod == "FUNC":
        AUTHFUNC = _get_conf("PLUGINKIT_AUTH_FUNC")
        if callable(AUTHFUNC):
            if AUTHFUNC():
                authResult.update(code=0)

    if authAidMethod == "IP":
        ip = request.headers.get('X-Real-Ip', request.remote_addr)
        BLACKLIST = _get_conf("PLUGINKIT_AUTH_IP_BLACKLIST") or []
        WHITELIST = _get_conf("PLUGINKIT_AUTH_IP_WHITELIST") or []
        if isinstance(BLACKLIST, (list, tuple)) and \
                isinstance(WHITELIST, (list, tuple)):
            if ip in WHITELIST and ip not in BLACKLIST:
                authResult.update(code=0)

    if hasattr(current_app, "extensions") and \
            "pluginkit" in current_app.extensions:
        g.pluginkit = current_app.extensions["pluginkit"]
        from flask_pluginkit import __version__ as version
        from flask_pluginkit import __author__ as author
        g.pluginkit_metadata = dict(
            author=author,
            version=version,
            plugins_count=len(g.pluginkit.get_all_plugins)
        )
    else:
        authResult.update(
            code=-1,
            msg="It is not a web application based on Flask-PluginKit."
        )

    if authResult["code"] != 0:
        return make_response(authTipmsg(authResult)), 403


@blueprint.route("/")
def index():
    #: plugins web manager page
    return render_template("manager.html")


@blueprint.route("/api", methods=["POST"])
def api():
    #: plugin api action
    res = dict(msg=None, code=1)
    if hasattr(g, "pluginkit"):
        Action = request.args.get("Action")
        plugin_name = request.args.get("plugin_name")
        if Action == "enablePlugin":
            try:
                g.pluginkit.enable_plugin(plugin_name)
            except Exception as e:
                res.update(msg="enable plugin failed:" + str(e), code=30000)
            else:
                res.update(code=0)
        elif Action == "disablePlugin":
            try:
                g.pluginkit.disable_plugin(plugin_name)
            except Exception as e:
                res.update(msg="disable plugin failed:" + str(e), code=40000)
            else:
                res.update(code=0)
        elif Action == "reloadApp":
            """reload web app
            WSGI:
                Gunicorn, uWSGI
            Required current_app.config:
                ENV='production'
                PLUGINKIT_PROCESSNAME='Real runtime process name'
                - for Gunicorn
                    PLUGINKIT_GUNICORN_ENABLED=True
                - for uWSGI
                    PLUGINKIT_UWSGI_ENABLED=True
            """
            try:
                import os
                import signal
                import psutil
            except ImportError:
                res.update(
                    code=20000,
                    msg="No dependent modules(psutil) installed"
                )
            else:
                ENV = _get_conf("ENV")
                PROCESSNAME = _get_conf("PLUGINKIT_PROCESSNAME")
                UWSGI_ENABLED = _get_conf("PLUGINKIT_UWSGI_ENABLED")
                GUNICORN_ENABLED = _get_conf("PLUGINKIT_GUNICORN_ENABLED")

                #: get gunicorn or uwsgi masterpid
                pid = os.getppid()
                p = psutil.Process(pid)

                def reload(pid):
                    """reload gunicorn or uwsgi"""
                    sleep(3)
                    os.kill(pid, signal.SIGHUP)

                if ENV == "production" and \
                        GUNICORN_ENABLED is True and \
                        p.name() == "gunicorn: master [%s]" % PROCESSNAME:
                    #: reload gunicorn
                    thread.start_new_thread(reload, (pid, ))
                    res.update(code=0)

                elif ENV == "production" and \
                        UWSGI_ENABLED is True and \
                        p.name() == (PROCESSNAME or "uwsgi"):
                    #: reload uwsgi
                    thread.start_new_thread(reload, (pid, ))
                    res.update(code=0)

                else:
                    res.update(
                        code=20001,
                        msg="According to the rules are not allowed to reload",
                    )
    else:
        res.update(msg="Environment is not effective", code=10000)

    return jsonify(res)
