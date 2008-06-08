## ActionView::Helpers::AssetTagHelper

### register\_javascript\_expansion

This method registers one or more javascript files to be included when a symbol, defined by the programmer, is given as a parameter to the **javascript\_include\_tag** method. The idea is to call this method inside the **init.rb** of your plugin, in order to register the javascript files which your plugin places in the folder **public/javascripts**. Let's see how it works:

	# In the init.rb file
	ActionView::Helpers::AssetTagHelper.register_javascript_expansion 
		:monkey => ["head", "body", "tail"] 

	# In our view:
	javascript_include_tag :monkey

	# We are going to have:
	<script type="text/javascript" src="/javascripts/head.js"></script>
	<script type="text/javascript" src="/javascripts/body.js"></script>
	<script type="text/javascript" src="/javascripts/tail.js"></script>


### register\_stylesheet\_expansion

This method does exactly the same as the **ActionView::Helpers::AssetTagHelper#register\_javascript\_expansion** method, but it creates a symbol to be used later when making calls to **stylesheet\_link\_tag** method. Look an example:

	# In the init.rb file
	ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion 
		:monkey => ["head", "body", "tail"] 

	# In our view:
	stylesheet_link_tag :monkey

	# We are going to have:
	<link href="/stylesheets/head.css"  media="screen" rel="stylesheet" 
		type="text/css" />
	<link href="/stylesheets/body.css"  media="screen" rel="stylesheet" 
		type="text/css" />
	<link href="/stylesheets/tail.css"  media="screen" rel="stylesheet" 
		type="text/css" />