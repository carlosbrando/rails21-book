## Partial Updates

The implementation of **Dirty Objects** was the starting point for another very interesting feature.
                                                                                                         
Since we can now track down what has changed in an object state, why not use it to avoid unnecessary updates to the database ?
  
On previous versions of Rails when we called **save** from an already existing **ActiveRecord** object, all of its fields would be updated in the database. Even the ones that had not suffered any change.

This action could be greatly enhanced with the use of **Dirty Objects** and it is exactly what happened. Take a loot at the SQL query generated in Rails 2.1 when trying to save an object that suffered a slight change: 

	article = Article.find(:first)
	article.title  #=> "Title"
	article.subject  #=> "Edge Rails"

	# Vamos atualizar um atributo…
	article.title = "New Title"

	# Veja o SQL criado ao persistir o objeto
	article.save
	#=>  "UPDATE articles SET title = 'New Title’ WHERE id = 1″
           
Only the fields that were changed in the application were also update in the database. If no field had been updated in the application, then **ActiveRecord** would not execute any update.
                                
To enable/disable this new feature you change the **partial\_updates** property related to your model.

	# To enable it
	MinhaClasse.partial_updates = true
         
If you wish to enable/disable this feature to all of your models, then you must edit the file *config/initializers/new\_rails\_defaults.rb*:

	# Enable it to all models
	ActiveRecord::Base.partial_updates = true
      
Don't forget to also inform Rails through *config/initializers/new\_rails\_defaults.rb* if you plan to edit a field without using the method **attr=**, like this:

	# If you use **attr=**, 
	# then it's ok not telling
	person.name = 'bobby'
	person.name_change    # => ['bob', 'bobby']
	
	
	# But you must inform that the field will be changed
	# if you plan not to use **attr=** 
	person.name_will_change!
	person.name << 'by'
	person.name_change    # => ['bob', 'bobby']
         
If you don't inform changes like these will occur, then they won't be able to be tracked down and your database table won't be correctly updated.
