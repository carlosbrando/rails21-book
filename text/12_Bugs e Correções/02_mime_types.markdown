##Mime Types

A bug which didn't allow you to define the assigned attribute for **request.format** using a symbol was fixed. Now you can use the code bellow:

	request.format = :iphone
	assert_equal :iphone, request.format
