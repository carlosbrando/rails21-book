## Storing the complete name of a class when using STI

Whenever we use **models** with **namespace** and **STI**, **ActiveRecord** stores just the name of the class, without its **namespace** (*demodulized*). This will only work when all of the classes in the **STI** are in the same **namespace**. Let's look at an example:

	class CollectionItem < ActiveRecord::Base; end
	class ComicCollection::Item < CollectionItem; end

	item = ComicCollection::Item.new
	item.type # => 'Item’

	item2 = CollectionItem.find(item.id)
	# returns an error, because it can't find
	# the class Item
      
This change adds a new option that makes **ActiveRecord** store the whole name of the class 

To enable/disable this feature, you should include or edit the following in your **environment.rb**.

	ActiveRecord::Base.store_full_sti_class = true
                             
Its default value is true.