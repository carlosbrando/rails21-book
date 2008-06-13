## caches\_action accepts conditionals

The **caches\_action** method now accepts the **:if** option, allowing the use of conditionals to specify when an **action** can be **cached**. For example:

	caches_action :index, :if => Proc.new { |c| !c.request.format.json? }

In the example above, the **action index** will go to the **cache** only if it's not accessed by a JSON request.
