## Accessing Helpers outside Views

How many times did you create a **helper** e wished to use it inside your **controller** ? To achive this, we needed to included the **helper** module inside the **controller**, but this makes your code look dirty.

For Rails 2.1 was developed a proxy to access helpers outside views. It works in a very simple way:

 	# To access simple_format method, for example
	ApplicationController.helpers.simple_format(text)

Simple and Clean!
