## The **sum** method

### Expressions in the **sum** method
            
Now we can use expressions in **ActiveRecord** methods that deal with calculation, like for example **sum**.

	Person.sum("2 * age")

### Change in the default return value of the sum method

In previous versions, when we used **ActiveRecord**'s **sum** method to calculate the result of the adition of all rows in a table and no row matched the conditions expressed during the method invocation, then the default return value would be **nil**.

In Rails 2.1 the default return value (that is when no row is found) is 0. See the example:

	Account.sum(:balance, :conditions => '1 = 2') #=> 0
