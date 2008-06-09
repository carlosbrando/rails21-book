## JSON

Rails now accepts POST's requests of JSON content. For example, you can send a POST request this way:

	POST /posts
	{"post": {"title": "Breaking News"}}

And everything goes to variable **params**. This works, for example:

	def create
	  @post = Post.create params[:post]
	  # …
	end

For those who doesn't know JSON is a "competitor" for XML, and it is widely used for JavaScript data interchange, because it's represented in this language. It takes its name from there: **JavaScript Object Notation**.
