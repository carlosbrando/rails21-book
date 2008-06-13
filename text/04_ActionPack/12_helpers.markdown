## Accessing Helpers outside Views

How often have you created a **helper** and wished you could use it inside your **controller** ? To achieve this functionality you had to included the **helper** module inside the **controller**, which made your code look ugly.

In Rails 2.1 a proxy to access helpers outside views was developed. It works in a very simple way:

 	# To access simple_format method, for example
	ApplicationController.helpers.simple_format(text)

Simple and Clean!
