##Railties


 
\* script/dbconsole fires up the command-line database client.  #102 [Steve Purcell]
 
\* Fix bug where plugin init.rb files from frozen gem specs weren't being run.  (pjb3) [#122 state:resolved]
 
\* Made the location of the routes file configurable with config.routes\_configuration\_file (Scott Fleckenstein) [#88]
 
\* Rails Edge info returns the latest git commit hash [Francesc Esplugas]
 
\* Added Rails.public\_path to control where HTML and assets are expected to be loaded from (defaults to Rails.root + "/public") #11581 [nicksieger]
 
\* rake time:zones:local finds correct base utc offset for zones in the Southern Hemisphere [Geoff Buesing]
 
\* Don't require rails/gem\_builder during rails initialization, it's only needed for the gems:build task. [rick]
 
\* script/performance/profiler compatibility with the ruby-prof >= 0.5.0. Closes #9176. [Catfish]
 
\* Flesh out rake gems:unpack to unpack all gems, and add rake gems:build for native extensions. #11513 [ddollar]
 
	rake gems:unpack             # unpacks all gems
	rake gems:unpack GEM=mygem   # unpacks only the gem 'mygem'
  
	rake gems:build              # builds all unpacked gems
	rake gems:build GEM=mygem    # builds only the gem 'mygem'
 
\* Add config.active\_support for future configuration options.  Also, add more new Rails 3 config settings to new\_rails\_defaults.rb [rick]
 
\* Add Rails.logger, Rails.root, Rails.env and Rails.cache shortcuts for RAILS\_\* constants [pratik]
 
\* Allow files in plugins to be reloaded like the rest of the application.  [rick]
 
Enables or disables plugin reloading.
  
	config.reload\_plugins = true
  
You can get around this setting per plugin.

If #reload_plugins? == false (DEFAULT), add this to your plugin's init.rb to make it reloadable:
    Dependencies.load_once_paths.delete lib\_path
If #reload_plugins? == true, add this to your plugin's init.rb to only load it once:
    Dependencies.load_once_paths << lib_path

\* Small tweak to allow plugins to specify gem dependencies.  [rick]
 
	# OLD open\_id\_authentication plugin init.rb
	require 'yadis'
	require 'openid'
	ActionController::Base.send :include, OpenIdAuthentication
 
	# NEW
	config.gem "ruby-openid", :lib => "openid", :version => "1.1.4"
	config.gem "ruby-yadis",  :lib => "yadis",  :version => "0.3.4"
 
	config.after_initialize do
    	ActionController::Base.send :include, OpenIdAuthentication
  	end
 
\* Added config.gem for specifying which gems are required by the application, as well as rake tasks for installing and freezing gems. [rick]
 
	Rails::Initializer.run do |config|
    	config.gem "bj"
    	config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
    	config.gem "aws-s3", :lib => "aws/s3"
  	end
  
	# List required gems.
		rake gems
  
	# Install all required gems:
		rake gems:install
  
	# Unpack specified gem to vendor/gems/gem\_name-x.x.x
		rake gems:unpack GEM=bj
 
\* Removed the default .htaccess configuration as there are so many good deployment options now (kept it as an example in README) [DHH]
 
\* config.time\_zone accepts TZInfo::Timezone identifiers as well as Rails TimeZone identifiers [Geoff Buesing]
 
\* Rails::Initializer#initialize\_time\_zone raises an error if value assigned to config.time\_zone is not recognized. Rake time zone tasks only require ActiveSupport instead of entire environment [Geoff Buesing]
 
\* Stop adding the antiquated test/mocks/\* directories and only add them to the path if they're still there for legacy reasons [DHH]
 
\* Added that gems can now be plugins if they include rails/init.rb #11444 [jbarnette]
 
\* Added Plugin#about method to programmatically access the about.yml in a plugin #10979 [lazyatom]
 
	plugin = Rails::Plugin.new(path\_to\_my\_plugin)
    plugin.about["author"] # => "James Adam"
    plugin.about["url"] # => "http://interblah.net"
 
\* Improve documentation. [Radar, Jan De Poorter, chuyeow, xaviershay, danger, miloops, Xavier Noria,  Sunny Ripert]
 
\* Added config.time\_zone = 'UTC' in the default environment.rb [Geoff Buesing]
 
\* Added rake tasks time:zones:all, time:zones:us and time:zones:local for finding time zone names for config.time\_zone option [Geoff Buesing]
 
\* Add config.time\_zone for configuring the default Time.zone value.  #10982 [Geoff Buesing]
 
\* Added support for installing plugins hosted at git repositories #11294 [danger]
 
\* Fixed that script/generate would not look for plugin generators in plugin\_paths #11000 [glv]
 
\* Fixed database rake tasks to work with charset/collation and show proper error messages on failure. Closes #11301 [matt]
 
\* Added a -e/--export to script/plugin install, uses svn export. #10847 [jon@blankpad.net)]
 
\* Reshuffle load order so that routes and observers are initialized after plugins and app initializers.  Closes #10980 [rick]
 
\* Git support for script/generate.  #10690 [ssoroka]
 
\* Update scaffold to use labels instead of bold tags.  Closes #10757 [zach-inglis-lt3]
 
\* Resurrect WordNet synonym lookups.  #10710 [tom./, matt]
 
\* Added config.cache\_store to environment options to control the default cache store (default is FileStore if tmp/cache is present, otherwise MemoryStore is used) [DHH]
 
\* Added that rails:update is run when you do rails:freeze:edge to ensure you also get the latest JS and config files #10565 [jeff]
 
\* SQLite: db:drop:all doesn't fail silently if the database is already open.  #10577 [Cheah Chu Yeow, mrichman]
 
\* Introduce native mongrel handler and push mutex into dispatcher.  [Jeremy Kemper]
 
\* Ruby 1.9 compatibility.  #1689, #10546 [Cheah Chu Yeow, frederico]
