## Defining the location of your routes file

In rails 2.1 you can define in which file your routes are stored, including the following line in your *enviroment.rb*:

	config.routes_configuration_file

This can be useful in a scenario where you have two separated front-ends that share the same modules, libraries and plugins.

For example, getsatisfaction.com and api.getsatisfaction.com shares the same models, but not the controllers, helpers and views. getsatisfaction has its own routes file with optimizations to improve its SEO, while the API route's file doesn't need nothing about SEO improvements.