## Time.current

A new method for **Time** class. The **current** method's return depends on **config.time\_zone**, if it was specified before, the method will return a **Time.zone.now**, otherwise will be a **Time.now**.

	# return value depends on config.time_zone
	Time.current

**since** and **ago** methods also had their returning values changed, returning a **TimeWithZone** in case **config.time\_zone** as specified.

It makes the **Time.current** method as new default method to get the actual time, replacing the **Time.now** (which keeps existing, but it doesn't consider the specified timezone).

The **datetime\_select** methods, **select\_datetime** and **select\_time** also have been updated to have their default returning as **Time.current**.
