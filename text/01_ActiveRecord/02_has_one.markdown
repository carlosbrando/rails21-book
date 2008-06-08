## Has\_one

### Support for the option through   

The method **has\_one** now has the option **through**. It works just like **has_many :through**, but it represents the association to a single **ActiveRecord** object.

	class Magazine < ActiveRecord::Base
	  has_many :subscriptions
	end

	class Subscription < ActiveRecord::Base
	  belongs_to :magazine
	  belongs_to :user
	end

	class User < ActiveRecord::Base
	  has_many :subscriptions
	  has_one :magazine, :through => : subscriptions, 
		        :conditions => ['subscriptions.active = ?', true]
	end
	
### Has\_one with :source\_type             
                               
The method **has\_one :through**, just mentioned above, can also take **:source\_type**. I will try to explain this through some examples. Let's start with these two classes:

	class Client < ActiveRecord::Base
	  has_many :contact_cards 

	  has_many :contacts, :through => :contact_cards
	end 
         
What we're looking at here is a **Client** class which **has_many** kinds of contacts, since the **ContactCard** class has a polymorphic relationship.

Next step in our example, let's create two classes to represent a **ContactCard**.

	class Person < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end

	class Business < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end
          
**Person** e **Business** relate to my **Client** class through the **ContactCard** table. In other words, I have two kinds of contacts, personal and business. This is not going to work, however. Watch what happens when I try to retrieve a contact:

	>> Client.find(:first).contacts
	# ArgumentError: /…/active_support/core_ext/hash/keys.rb:48:
	# in `assert_valid_keys’: Unknown key(s): polymorphic 
                       
To make this work we have to use **:source_type**. Let's change our **Client** class:

	class Client < ActiveRecord::Base
	  has_many :people_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :person 

	  has_many :business_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :business
	end
	                       
Notice that we now have two different ways to retrieve our contacts and we can say what contact **:source_type** we are expecting.

	Client.find(:first).people_contacts
	Client.find(:first).business_contacts
