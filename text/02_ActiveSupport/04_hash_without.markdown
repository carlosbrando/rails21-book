## Hash#without

Do you know **slice** method which Rails adds to the **Hash** object? **slice** method is very useful in many situations. Look an example:

	def search(criteria = {})
	  assert_valid_keys(:mass, :velocity, :time)
	end

	search(options.slice(:mass, :velocity, :time))

My **search** method waits for a **Hash** with they keys **:mass**, **:velocity** and **:time**, if I give one more key inside the **Hash**, **assert\_valid\_keys** method will return an **ArgumentError**. To avoid this problem, I'm using the **slice** method  so only the correct keys will be given to the method.

That's what **slice** method does, it returns a **Hash** with only the given keys.

In Rails 2.1 we have a reverse method for **slice**, **without** method which returns a **Hash** without the given keys.

	Event.new(event.attributes.without(:id, :user_id))
