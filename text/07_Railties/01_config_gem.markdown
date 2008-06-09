## config.gem

Now it's possible to configure all necessary gems to get a project running by using a new feature called **config.gem**. In  **environment.rb** file you can specify which gems your project depends to run. Look at the example:

	config.gem "bj" 

	config.gem "hpricot", :version => '0.6',
	                      :source => "http://code.whytheluckystiff.net" 

	config.gem "aws-s3", :lib => "aws/s3"

To install all dependencies at once, we just use a Rake task:

	# Installs all specified gems
	rake gems:install

It's also possible to list which gems are being used in the running project by using:

	# Listing all gem dependencies
	rake gems

If one of the gems have a **rails/init.rb** file and you want to take the gem with your application, you can use:

	# Copy the specified gem to vendor/gems/nome_do_gem-x.x.x
	rake gems:unpack GEM=gem_name

Then, the gem will be copied to the directory  **vendor/gems/gem\_name-x.x.x**. In case you don't specify gem name, Rails will copy all gems to the directory **vendor/gem**

## config.gem in plugins

The **config.gem** feature is also available for use with plugins.

Untill Rails 2.0 the **init.rb** file of a plugin used to look like this:

	# init.rb of plugin open_id_authentication
	require 'yadis' 
	require 'openid' 
	ActionController::Base.send :include, OpenIdAuthentication 

But in Rails 2.1 the **init.rb** file would be:

	config.gem "ruby-openid", :lib => "openid", :version => "1.1.4"
	config.gem "ruby-yadis",  :lib => "yadis",  :version => "0.3.4" 

	config.after_initialize do
	  ActionController::Base.send :include, OpenIdAuthentication
	end

So, when you run the task to install all necessary gems, these gems will be among them.
