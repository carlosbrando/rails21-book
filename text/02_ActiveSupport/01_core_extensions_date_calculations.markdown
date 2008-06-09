## ActiveSupport::CoreExtensions::Date::Calculations

### Time#end\_of\_day

Returns the current date with the time set to 11:59:59 PM.

### Time#end\_of\_week

Returns the end of the week (Sunday 11:59:59 PM).

### Time#end\_of\_quarter

Returns a Date object representing the end of the trimester. In other words, it returns the last day of either march, june, september or december, depending on the current date.

### Time#end\_of\_year

Returns December 31 at 11:59:59 PM

### Time#in\_time\_zone

This method is similar to **Time#localtime**, except by the fact it uses **Time.zone** instead of the underlying operating system's timezone. You can pass either **TimeZone** or **String** as a parameter. Look at some examples:

	Time.zone = 'Hawaii'
	Time.utc(2000).in_time_zone
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

	Time.utc(2000).in_time_zone('Alaska')
	# => Fri, 31 Dec 1999 15:00:00 AKST -09:00

### Time#days\_in\_month

A bug in the method **days\_in\_month** was fixed, which returned the wrong number of days in february when the year was was not specified. 

Changes comprise in using the current year as the default value when not specifying the year in method call. Suppose you were in a leap year. Look the following example:

	Loading development environment (Rails 2.0.2)
	>> Time.days_in_month(2)
	=> 28

	Loading development environment (Rails 2.1.0)
	>> Time.days_in_month(2)
	=> 29

### DateTime#to_f

**DateTime** class received a new method called **to_f** which returns the date as a type float number representing the number of seconds since the Unix epoch (number of seconds since january 1st, 1970, midnight).

### Date.current

**Date** class received a new method called **current** which must now be used instead of **Date.today**, because it considers the timezone set in **config.time\_zone** in case it is set, returning a **Time.zone.today**. If it is not set, then it returns a **Date.today**.
