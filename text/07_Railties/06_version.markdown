## Rails.version

In earlier versions to discover at runtime time which Rails version is in use the following was used:

	Rails::VERSION::STRING

In Rails 2.1 this was changed to shorter:

	Rails.version

