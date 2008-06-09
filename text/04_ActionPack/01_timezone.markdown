## TimeZone

### Defining a default timezone

One new option was added to **time\_zone\_select** method, now you can present a default value in cases when your user doesn't  selected any **TimeZone**, or when the database column is null. To achive this, it was created the **:default** option, so you can use the method in the following way:

	time_zone_select("user", "time_zone", nil, :include_blank => true)
	
	time_zone_select("user", "time_zone", nil, 
		:default => "Pacific Time (US & Canada)" )
	
	time_zone_select( "user", 'time_zone', TimeZone.us_zones, 
		:default => "Pacific Time (US & Canada)")

In cases where is used **:default** option, it must be shown with the informed **TimeZone** already selected.

### The formatted_offset method

The **formatted\_offset** method was included in the **Time** and **DateTime** classes to return with the format **+HH:MM** the deviation of UTC time. For example, in our timezone (Brasilia time) the deviation value returned by the method would be a string with its value set to **"-03:00″**.

Let's see some examples:

Getting the deviation from a DateTime:

	datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
	datetime.formatted_offset         # => "-06:00″
	datetime.formatted_offset(false)  # => "-0600″

Now from Time:

	Time.local(2000).formatted_offset         # => "-06:00″
	Time.local(2000).formatted_offset(false)  # => "-0600″

Note this method returns **string**, which can be formatted or not depending of the value given as parameter.

### The with\_env\_tz method

The **with\_env\_tz** method allows us to make tests with different timezones in a very simple way:

	def test_local_offset
	  with_env_tz 'US/Eastern' do
	    assert_equal Rational(-5, 24), DateTime.local_offset
	  end
	  with_env_tz 'US/Central' do
	    assert_equal Rational(-6, 24), DateTime.local_offset
	  end
	end

This helper was supposed to call **with\_timezone**, but it was renamed for **with\_env\_tz** to avoid confusion with the timezone informed by using **ENV['TZ']** and **Time.zone**.

### Time.zone_reset!

It was removed for not being used anymore

### Time#in\_current\_time\_zone

It was modified to return **self** when **Time.zone** is null. 

### Time#change\_time\_zone\_to\_current

It was modified to return **self** when **Time.zone** is null. 

### TimeZone#now

The **TimeZone#now** method was modified to return an **ActiveSupport::TimeWithZone** representing the current time in the configured timezone as defined in **Time.zone**. For example:

	Time.zone = 'Hawaii'  # => "Hawaii"
	Time.zone.now         # => Wed, 23 Jan 2008 20:24:27 HST -10:00

### Compare\_with\_coercion
	
It was created the method **compare\_with\_coercion** (with an alis for <=>) in **Time** e **DateTime** classes, becoming possible to make a chronologically comparison between the **Time**, **DateTime** classes and instances of  **ActiveSupport::TimeWithZone** objects. For a better understanding, look the examples bellow (each line result is in the comment placed following the code):

	Time.utc(2000) <=> Time.utc(1999, 12, 31, 23, 59, 59, 999) # 1
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0, 001)) # -1

	Time.utc(2000) <=> DateTime.civil(1999, 12, 31, 23, 59, 59) # 1
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 1)) # -1

	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(1999, 12, 31, 23, 59, 59) )
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(2000, 1, 1, 0, 0, 0) )
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new(Time.utc(2000, 1, 1, 0, 0, 1) ))

### TimeWithZone#between?

It was included the **between?** method in the **TimeWithZone** class to verify if an instance is found between two dates. Example:

	@twz.between?(Time.utc(1999,12,31,23,59,59),
	              Time.utc(2000,1,1,0,0,1))
	
### TimeZone#parse
	
This method creates a new instance of **ActiveSupport::TimeWithZone** from a string. For example:

	Time.zone = "Hawaii"
	# => "Hawaii"
	Time.zone.parse('1999-12-31 14:00:00')
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00


	Time.zone.now
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00
	Time.zone.parse('22:30:00')
	# => Fri, 31 Dec 1999 22:30:00 HST -10:00

### TimeZone#at

This method can be used to create a new instance of **ActiveSupport::TimeWithZone** from the number of seconds since Unix epoch. For example:

	Time.zone = "Hawaii" # => "Hawaii"
	Time.utc(2000).to_f  # => 946684800.0

	Time.zone.at(946684800.0)
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

### More methods

The **to\_a**, **to\_f**, **to\_i**, **httpdate**, **rfc2822**, **to\_yaml**, **to\_datetime** and **eql?** methodos were added in the **TImeWithZone** class. For more information about these methodos please head to **Rails** documentation.

### TimeWithZone class preparing itself for Ruby 1.9

In Ruby 1.9 we'll have some new methods in the **Time** class, methods such as:

	Time.now
	# => Thu Nov 03 18:58:25 CET 2005

	Time.now.sunday?
	# => false

It exists one for each day of the week.

Another curiosity is that **to\_s** method of **Time** object will have a different returning value. Today when we execute **Time.new.to\_s**, we have the following:

	Time.new.to_s
	# => "Thu Oct 12 10:39:27 +0200 2006″

In Ruby 1.9 we will have:

	Time.new.to_s
	# => "2006-10-12 10:39:24 +0200″

What's all of that have about with Rails 2.1 ? Everything, since Rails is being prepared to deal with these modifications. The **TimeWithZone** class, for example, just received an implementation to work with the methods of the first example.
