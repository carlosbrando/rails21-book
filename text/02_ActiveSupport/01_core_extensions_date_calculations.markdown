## ActiveSupport::CoreExtensions::Date::Calculations

### Time#end\_of\_day

Returns today with the time set to 11:59:59 PM.

### Time#end\_of\_week

Returns the end of the week (Sunday 11:59:59 PM).

### Time#end\_of\_quarter

Returns a Date object representing the end of the trimester. In other words, it returns the last day of march, june, september, december, whatever it happens first.

### Time#end\_of\_year

Returns December 31 at 11:59:59 PM

### Time#in\_time\_zone

This method is similar to **Time#localtime**, except by the fact it uses **Time.zone** in substitution of the operating system timezone. You can pass as parameter a **TimeZone** or **String**. Look some examples:

	Time.zone = 'Hawaii'
	Time.utc(2000).in_time_zone
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

	Time.utc(2000).in_time_zone('Alaska')
	# => Fri, 31 Dec 1999 15:00:00 AKST -09:00

### Time#days\_in\_month

It was fixed a bug in the method **days\_in\_month** which was returning the number of days of february in a erroneous form when year wasn't specified. 

Changes comprise in using the current year as default when not specifying a year in method call. Supposing you are in a leap year, look the example:

	Loading development environment (Rails 2.0.2)
	>> Time.days_in_month(2)
	=> 28

	Loading development environment (Rails 2.1.0)
	>> Time.days_in_month(2)
	=> 29

### DateTime#to_f

**DateTime** class received a new method called **to_f** which returns the date as float number representing the number of seconds since Unix epoch. It means, the total of seconds since january 1st of 1970 at midnight.

### Date.current

**Date** class received a new method called **current** which must be used in substitution of **Date.today**, because it considers the timezone set in **config.time\_zone** if it has been configured, returning a **Time.zone.today**. If it hasn't been configured  it returns a **Date.today**.