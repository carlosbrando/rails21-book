##Getting information about a plugin

This is one of the new Rails 2.0 features which you probably never use it. I say "probably", because in some very specific case it can be useful, for example, to know plugin version.

To test it, we need to create a new file called *about.yml* in the plugin directory, something like this:

	author: Carlos Brando
	version: 1.2.0
	description: A description about the plugin
	url: http://www.nomedojogo.com

We can get this information later this way:

	plugin = Rails::Plugin.new(plugin_directory)
	plugin.about["author"] # => “Carlos Brando”
	plugin.about["url"] # => “http://www.nomedojogo.com”

If you find some good use for this feature and want to share with me, maybe i can change my mind about its real need.
