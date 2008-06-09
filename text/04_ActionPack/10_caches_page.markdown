## Conditional in the caches\_page method

The **caches\_page** method now has the option to use conditionals (**:if**). See an example:

	# actual way
	caches_page :index

	# In Rails 2.1 you can use :if option
	caches_page :index, :if => Proc.new { |c| !c.request.format.json? }
