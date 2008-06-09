##Mime Types

It was fixed a bug which didn't allow you to define the assigned attribute for **request.format** using a symbol. Now, we can use the code bellow:

	request.format = :iphone
	assert_equal :iphone, request.format
