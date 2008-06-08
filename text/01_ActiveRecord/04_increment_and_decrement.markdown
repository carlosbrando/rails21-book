## Increment and decrement

**ActiveRecord**'s methods **increment**, **increment!**, **decrement** and **decrement!** can now take a new optional parameter. On previous verions of Rails you could use these methods to add or subtract 1 (one) from a given column. In Rails 2.1 you can tell which value that is to be added or subtracted. Like this:

	player1.increment!(:points, 5)
	player2.decrement!(:points, 2)
                                      
In the above example I am adding 5 points to player1 and subtracting 2 points from player2. Since this is an optional parameter, legacy code is not affected.