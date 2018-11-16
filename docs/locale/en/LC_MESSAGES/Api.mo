��    m      �              �     �  5   �  H   4  "   }  s   �         	  '   4	  V   \	  -   �	  �   �	     �
      �
  c   �
  ?   J  G   �  M   �  a         �  Y   �     �          %     ?     U  T   i     �     �      �       -        L  "   b     �  �   �  \   M  N   �  0   �     *  #   :  ;   ^      �  �   �  |   w     �       �     �   �     �  @   �  �   �  t   �  ]   e  >   �  D        G  1   c     �     �  	   �     �     �  ?   �  W     5   `     �  
   �     �  P   �       ;   &     b  '   z  	   �  $   �     �     �     �        +        D     P     `     m  	   }  @   �      �     �     �  .   �  z   ,  t   �  z     4   �  E   �       O   $     t  '   z     �  1   �     �     �  !   �  8     3   V     �     �  �  �     ,  5   =  H   s  "   �  s   �    S      Y!  '   s!  V   �!  -   �!  �    "     �"      #  c   %#  ?   �#  G   �#  M   $  a   _$     �$  Y   �$     +%     D%     d%     ~%     �%  T   �%     �%     &      %&     F&  -   ]&     �&  "   �&     �&  �   �&  \   �'  N   �'  0   8(     i(  #   y(  ;   �(      �(  �   �(  |   �)     3*     L*  �   ]*  �   +     �+  @   �+  �   <,  t   /-  ]   �-  >   .  D   A.     �.  1   �.     �.     �.  	   �.     �.     /  ?   /  W   G/  5   �/     �/  
   �/     �/  P   0     U0  ;   e0     �0  '   �0  	   �0  $   �0     1     1     &1     ?1  +   W1     �1     �1     �1     �1  	   �1  @   �1      2     (2     /2  .   <2  z   k2  t   �2  z   [3  4   �3  E   4     Q4  O   c4     �4  '   �4     �4  1   �4     5     5  !   :5  8   \5  3   �5     �5     �5   2018 by staugur. A meaningful plugin structure should look like this:: Add a plugin, support only for `.tar.gz` or `.zip` compression packages. All supported data types in python Assuming that the following templates need to be enabled for introducing CSS files using emit_metal, for examples:: Because flask-pluginkit has registered all cep into the app at load time,  if your web application uses before_request and plugins depend on one of them (like g), the plugin will not run properly,  so your web application should use this decorator at this time. Blueprint extension point Blueprint instance for managing plugins Boolean: for method is local, remove the plugin source code package, default is False. Cascading style sheet (CSS) extension points. Common storage interface with :class:`~flask_pluginkit.LocalStorage` or :class:`~flask_pluginkit.RedisStorage`, sf is a custom storage interface classes, args is its parameters, highest priority. Connect a dcp, push a function. DCPError: raises an exception Disable a plugin (that is, create a DISABLED empty file) and restart the application to take effect Dynamic join point initialization, format:: dict(event=deque()) Emit a event(with dcp) and gets the dynamic join point data(html code). Emit a event(with tep) and gets the template extension point data(html code). Enable a plugin (that is, create a ENABLED empty file) and restart the application to take effect Example usage:: Flask Plugin Manager Extension, collects all plugins and maps the metadata to the plugin. Flask-PluginKit.fixflask Flask-PluginKit.flask_pluginkit Flask-PluginKit.installer Flask-PluginKit.utils Flask-PluginKit.web Function used internally to send static files from the static folder to the browser. Get all enabled plugins Get all plugins Get persistent data from shelve. Get plugin information Gets the css extension point data(html code). Hook extension point. MIT, see LICENSE for more details. Open handle Please use this function between in the template, and the application needs to support multiple static folder functions, that is, the app initialized with :class:`~flask_pluginkit.Flask`. Please use this function in the template. The extension point needs to be defined by itself. Push a function for :class:`~flask_pluginkit.PluginManager`, :func:`push_dcp`. Registers a function to run before each request. Remove a plugin Restful api returns the json format Return json data, public return: {"msg": null, "code": int} Set persistent data with shelve. Simple storage service(s3), currently optional: local or redis. May increase in the future: memcache. You can also inherit :class:`~flask_pluginkit.BaseStorage`, custom storage interface. Suppose you have an extension point named `tep`, only need to enable custom extension points in the template, for examples:: Template extension point Template sorting The current class code from flask-multistatic, support for multiple static folder, in addition, also increases the before_req decorator to set the xx the highest priority The plugin is a directory, the directory name is the plugin name, and the plugin entry file is **__init__.py**, including __plugin_name__, __description__, __version__, __author__, __state__ and other plugin metadata. The plugin package name. The position of the insertion function, right(default) and left. The usage is equivalent to the :func:`before_request` decorator, and  before_request registers the function at the end of the before_request_funcs, while  this decorator registers the function at the top of the before_request_funcs (index 0). When code is 0, the request is successful; non-zero is the request failure, at this time, msg has a failure message. `remote`, download and unpack a remote plugin package; `local`, unzip a local plugin package. after_request_hook, After request (no exception before return) before_request_hook, Before request (intercept requests are allowed) check python version 2 or 3 class based :class:`~flask_pluginkit.BaseStorage` class init args class instance copyright data dict dict: Keyword parameter, additional data passed to the template dict: add the result of the plugin, like dict(msg=str, code=int), code=0 is successful. dict: {tep: dict(HTMLFile=[], HTMLString=[]), tep...} dict: {yep: [css...], ...} exceptions fixflask fixflask: A class inheritance of flask, and added some additional functionality. flask_pluginkit function: Corresponding to the event to perform a function. get key data from redis html code with :class:`~jinja2.Markup`. installer installer: install or remove plugin. license list all data list redis key hash data logging Logger instance open handler, you need install redis module params args params callback params event params position params sf plugin installer for installing a compressed local/remote plugin pluginkit: load and run plugins. raises set key data str,unicode: A unique identifier name for dcp. str: Name of css extension point, the only, a analytical results for the list or yep, can be used directly `link CSS` code str: Render type, default value = "all" all - render all, is default; fil - render HTML file; cod - render HTML code str: Template extension point name, which is unique, a tep parsing result is list, within which can be HTML code and files str: for method is local, plugin local absolute path str: for method is remote, plugin can be downloaded from the address. string: Index key teardown_request_hook, After request (before return, with or without exception) utils utils: Some tool classes and functions. web web: The server-side plugin management blueprint. 参数 基类：:class:`Exception` 基类：:class:`flask.app.Flask` 基类：:class:`flask_pluginkit.exceptions.PluginError` 基类：:class:`flask_pluginkit.utils.BaseStorage` 基类：:class:`object` 返回 Project-Id-Version: Flask-PluginKit 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-11-16 14:07+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 2018 by staugur. A meaningful plugin structure should look like this:: Add a plugin, support only for `.tar.gz` or `.zip` compression packages. All supported data types in python Assuming that the following templates need to be enabled for introducing CSS files using emit_metal, for examples:: Because flask-pluginkit has registered all cep into the app at load time,  if your web application uses before_request and plugins depend on one of them (like g), the plugin will not run properly,  so your web application should use this decorator at this time. Blueprint extension point Blueprint instance for managing plugins Boolean: for method is local, remove the plugin source code package, default is False. Cascading style sheet (CSS) extension points. Common storage interface with :class:`~flask_pluginkit.LocalStorage` or :class:`~flask_pluginkit.RedisStorage`, sf is a custom storage interface classes, args is its parameters, highest priority. Connect a dcp, push a function. DCPError: raises an exception Disable a plugin (that is, create a DISABLED empty file) and restart the application to take effect Dynamic join point initialization, format:: dict(event=deque()) Emit a event(with dcp) and gets the dynamic join point data(html code). Emit a event(with tep) and gets the template extension point data(html code). Enable a plugin (that is, create a ENABLED empty file) and restart the application to take effect Example usage:: Flask Plugin Manager Extension, collects all plugins and maps the metadata to the plugin. Flask-PluginKit.fixflask Flask-PluginKit.flask_pluginkit Flask-PluginKit.installer Flask-PluginKit.utils Flask-PluginKit.web Function used internally to send static files from the static folder to the browser. Get all enabled plugins Get all plugins Get persistent data from shelve. Get plugin information Gets the css extension point data(html code). Hook extension point. MIT, see LICENSE for more details. Open handle Please use this function between in the template, and the application needs to support multiple static folder functions, that is, the app initialized with :class:`~flask_pluginkit.Flask`. Please use this function in the template. The extension point needs to be defined by itself. Push a function for :class:`~flask_pluginkit.PluginManager`, :func:`push_dcp`. Registers a function to run before each request. Remove a plugin Restful api returns the json format Return json data, public return: {"msg": null, "code": int} Set persistent data with shelve. Simple storage service(s3), currently optional: local or redis. May increase in the future: memcache. You can also inherit :class:`~flask_pluginkit.BaseStorage`, custom storage interface. Suppose you have an extension point named `tep`, only need to enable custom extension points in the template, for examples:: Template extension point Template sorting The current class code from flask-multistatic, support for multiple static folder, in addition, also increases the before_req decorator to set the xx the highest priority The plugin is a directory, the directory name is the plugin name, and the plugin entry file is **__init__.py**, including __plugin_name__, __description__, __version__, __author__, __state__ and other plugin metadata. The plugin package name. The position of the insertion function, right(default) and left. The usage is equivalent to the :func:`before_request` decorator, and  before_request registers the function at the end of the before_request_funcs, while  this decorator registers the function at the top of the before_request_funcs (index 0). When code is 0, the request is successful; non-zero is the request failure, at this time, msg has a failure message. `remote`, download and unpack a remote plugin package; `local`, unzip a local plugin package. after_request_hook, After request (no exception before return) before_request_hook, Before request (intercept requests are allowed) check python version 2 or 3 class based :class:`~flask_pluginkit.BaseStorage` class init args class instance copyright data dict dict: Keyword parameter, additional data passed to the template dict: add the result of the plugin, like dict(msg=str, code=int), code=0 is successful. dict: {tep: dict(HTMLFile=[], HTMLString=[]), tep...} dict: {yep: [css...], ...} exceptions fixflask fixflask: A class inheritance of flask, and added some additional functionality. flask_pluginkit function: Corresponding to the event to perform a function. get key data from redis html code with :class:`~jinja2.Markup`. installer installer: install or remove plugin. license list all data list redis key hash data logging Logger instance open handler, you need install redis module params args params callback params event params position params sf plugin installer for installing a compressed local/remote plugin pluginkit: load and run plugins. raises set key data str,unicode: A unique identifier name for dcp. str: Name of css extension point, the only, a analytical results for the list or yep, can be used directly `link CSS` code str: Render type, default value = "all" all - render all, is default; fil - render HTML file; cod - render HTML code str: Template extension point name, which is unique, a tep parsing result is list, within which can be HTML code and files str: for method is local, plugin local absolute path str: for method is remote, plugin can be downloaded from the address. string: Index key teardown_request_hook, After request (before return, with or without exception) utils utils: Some tool classes and functions. web web: The server-side plugin management blueprint. 参数 基类：:class:`Exception` 基类：:class:`flask.app.Flask` 基类：:class:`flask_pluginkit.exceptions.PluginError` 基类：:class:`flask_pluginkit.utils.BaseStorage` 基类：:class:`object` 返回 