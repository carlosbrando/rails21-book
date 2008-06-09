## Auto Link

For those who doesn't know,  **auto\_link** method receives any text given as parameter, and if the texts has some e-mail address or an website, it returns the same text, but with hyperlinks.

For example:

	auto_link("Go to this website now: http://www.rubyonrails.com")
	# => Go to this website now: http://www.rubyonrails.com

Some sites, like Amazon, are also using the "=" symbol in their URL's, and this method doesn't recognize that symbol. Look how the method behaves in such case:

	auto_link("http://www.amazon.com/Testing/ref=pd_bbs_sr_1")
	# => http://www.amazon.com/Testing/ref

Note the method finished the hyperlink exactly before the "=" symbol, because it doesn't support that symbol. I mean, it used not to support. In Rails 2.1 we have this problem fixed.

The same method was updated later to also allow the use of URL's with parenthesis.

An URL example using parenthesis:

	http://en.wikipedia.org/wiki/Sprite_(computer_graphics)
