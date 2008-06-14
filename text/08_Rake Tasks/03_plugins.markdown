## Plugins

### Gems can now be plugins

Now, any gem that has a **rails/init.rb** file can be installed inside the **vendor** directory of your Rails project just like a **plugin**.

### Using generators in plugins

It's possible to configure **Rails** to search for **plugins** in places other than the **vendor/plugins** directory, just including this line of code in your **environment.rb**.

	config.plugin_paths = ['lib/plugins', 'vendor/plugins']
	
Rails 2.0 had a bug in this configuration that showed up when the plugin had generators. Because of that bug Rails only found generators in plugins that were inside the **vendor/plugins** directory. In 2.1 this bug was squashed.