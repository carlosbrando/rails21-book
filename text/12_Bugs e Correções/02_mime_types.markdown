##Mime Types

It was fixed a bug which doesn't allowed to define the assigned attribute for **request.format** using a symbol. Now, we can use the code bellow:

	request.format = :iphone
	assert_equal :iphone, request.format
