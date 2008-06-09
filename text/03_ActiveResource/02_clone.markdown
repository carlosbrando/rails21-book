## The clone method

Now we can clone an existing resource:

	ryan = Person.find(1)
	not_ryan = ryan.clone
	not_ryan.new?  # => true

Please note the copied object doesn't clone any of the class attributes, just the resource attributes.

	ryan = Person.find(1)
	ryan.address = StreetAddress.find(1, :person_id => ryan.id)
	ryan.hash = {:not => "an ARes instance"} 

	not_ryan = ryan.clone
	not_ryan.new?            # => true
	not_ryan.address         # => NoMethodError
	not_ryan.hash            # => {:not => "an ARes instance"}