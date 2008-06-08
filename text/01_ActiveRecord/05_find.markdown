## Find

### Conditions
            
From now on, one can pass an object as a parameter to **ActiveRecord**'s **find** method. See this example:

	class Account < ActiveRecord::Base
	  composed_of :balance, :class_name => "Money", :mapping => %w(balance amount)
	end
            
In this case, you can pass a **Money** object as a parameter for the **find** method from the **Account** class, like this:

	amount = 500
	currency = "USD"
	Account.find(:all, :conditions => { :balance => Money.new(amount, currency) })
	
### Last
           
Up to now we could only use three operators to look for data using **ActiveRecord**'s **find** method. These are: **:first**, **:all** and the object's own id (in this case whe don't pass any argument to **find** besides the id itself)

Now there is a forth operator named **:last**. A few examples:

	Person.find(:last)
	Person.find(:last, :conditions => [ "user_name = ?", user_name])
	Person.find(:last, :order => "created_on DESC", :offset => 5)
	                                                             
To fully understand how this method works, just look at the following test:

	def test_find_last
	  last  = Developer.find :last
	  assert_equal last, Developer.find(:first, :order => 'id desc')
	end
	
### All
                      
The static method **all** is an alias to the also static **find(:all)**. Example:
	
	Topic.all is the same as Topic.find(:all)

### First
              
The static method **first** is an alias to the also static **find(:first)**. Example:

	Topic.first is the same as Topic.find(:first)

### Last

The static method **last** is an alias to the also static **find(:last)**. Example:

	Topic.last is the same as Topic.find(:last)

             
## Using **first** and **last** methods in named\_scope

All the methods mentioned above also work in **named\_scope**. Suppose we create a **named\_scope** named **recent**. The following is legal:

		post.comments.recent.last
