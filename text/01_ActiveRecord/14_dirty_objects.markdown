## Dirty Objects
                  
Now in Rails we are able to keep track of changes made to **ActiveRecord**. It is possible to know if an object has been changed or not. In case it has been changed, we can track down its latest changes. Let's take look at a few examples:

  article = Article.find(:first)
	article.changed?  #=> false

	article.title  #=> "Title"
	article.title = "New Title"
	article.title_changed? #=> true

	# shows title before change
	article.title_was  #=> "Title"

	# before and after the change
	article.title_change  #=> ["Title", "New Title"]

As you can see it is very simple. You can also list all changes made to the object in one of two ways:

	# returns a list with all of the attributes that were changed
	article.changed  #=> ['title']

	# returns a hash with attributes that were changed 
	# along with its values before and after
	article.changes  #=> { 'title’ => ["Title", "New Title"] }
             
Notice that when an object is saved, its status changes:

	article.changed?  #=> true
	article.save  #=> true
	article.changed?  #=> false
   
In case you want to change an object's state without using **attr=**, you will need to explicitly inform that the attribute was changed by using the method **attr\_name\_will\_change!** (replace **attr** with an object's real attribute). Let's look at one last example:
    
	article = Article.find(:first)
	article.title_will_change!
	article.title.upcase!
	article.title_change  #=> ['Title', 'TITLE']
