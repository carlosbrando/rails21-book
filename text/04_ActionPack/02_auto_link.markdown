## Auto Link

The **auto\_link** method receives any text given as parameter, and if the texts has some e-mail address or an website, it returns the same text, but with hyperlinks.

For example:

	auto_link("Go to this website now: http://www.rubyonrails.com")
	# => Go to this website now: http://www.rubyonrails.com

Some sites, like Amazon, use the "=" symbol in their URL's. This method doesn't recognize that symbol. Look how the method behaves in such case:

	auto_link("http://www.amazon.com/Testing/ref=pd_bbs_sr_1")
	# => http://www.amazon.com/Testing/ref

Note the method finished the hyperlink exactly before the "=" symbol, before Rails 2.1 that symbol was not supported. 

The same method was updated later to also allow the use of URL's with parenthesis.

An URL example using parenthesis:

	http://en.wikipedia.org/wiki/Sprite_(computer_graphics)
