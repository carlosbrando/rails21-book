## Polymorphic url

Helper methods for polymorphic URL are used as a more elegant solution to renamed routes when you're working with an object from **ActiveRecord**.
                                    
These methods come in handy when you want to generate the URL for a **RESTful** resource without specifying the type it is going to be associated with.
                                      
It is very simple to work with them. Take a look at a few examples (commented out is how the same thing is done in Rails' versions prior to 2.1):                             

	record = Article.find(:first) 
	polymorphic_url(record) #-> article_url(record)

	record = Comment.find(:first)
	polymorphic_url(record)  #->  comment_url(record)

	# it can also identify recently created elements
	record = Comment.new
	polymorphic_url(record)  #->  comments_url()
	                  
Notice how the **polymorphic_url** method is able to identify the type that is given to him and generates the correct routes. **Nested resources** and **namespaces** are also supported:

	polymorphic_url([:admin, @article, @comment])
	#-> this will return:
	admin_article_comment_url(@article, @comment)
	           
You can also use prefixes such as **new**, **edit** and **formatted**. Take a look at a few examples:

	edit_polymorphic_path(@post)
	#=> /posts/1/edit

	formatted_polymorphic_path([@post, :pdf])
	#=> /posts/1.pdf
