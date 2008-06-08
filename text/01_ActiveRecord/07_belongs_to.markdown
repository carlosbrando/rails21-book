## Belongs_to
       
The **belongs\_to** method was changed in order to allow the use of **:dependent => :destroy** and **:delete** in associations.
For example:

	belongs_to :author_address
	belongs_to :author_address, :dependent => :destroy
	belongs_to :author_address_extra, :dependent => :delete, 
		:class_name => "AuthorAddress"
