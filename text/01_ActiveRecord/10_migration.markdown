## Methods add\_timestamps and remove\_timestamps       
  
We now have two new methods: **add\_timestamps** and **remove\_timestamps**. They add and remove, respectively, **timestamp** columns. Let's take a look at an example:

	def self.up
	  add_timestamps :feeds
	  add_timestamps :urls
	end

	def self.down
	  remove_timestamps :urls
	  remove_timestamps :feeds
	end
