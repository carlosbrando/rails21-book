## Method table_exists?
           
New method for the **AbstractAdapter** class: **table\_exists**. It is very simple to use:

	>> ActiveRecord::Base.connection.table_exists?("users")
	=> true
