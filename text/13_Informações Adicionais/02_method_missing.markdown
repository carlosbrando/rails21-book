## Used method\_missing, then don't leave loose ends

Due to Ruby's dynamic nature, the method **respond\_to?** is crucial. How many times have you checked if a method exists in the object ? Or how often have you checked if the object is what we are expecting (**is\_a?**)?

However there's something really important that many people forget. Look at this class's usage of the method **method\_missing**:

	class Dog
	  def method_missing(method, *args, &block)
	    if method.to_s =~ /^bark/
	      puts "woofwoof!"
	    else
	      super
	    end
	  end
	end

	rex = Dog.new
	rex.bark #=> woofwof!
	rex.bark! #=> woofwoof!
	rex.bark_and_run #=> woofwoof!

I think you already know **method\_missing**, don't you? In the example above I'm creating an instance of the class **Dog** and calling the methods **bark**, **bark!** e **bark\_and\_run** that don't exist. Then the method **method\_missing** is called, where I use a simple regular expression to return "woofwoof!", whenever the name of the method begins with bark.

But look what happens when I try to use the method **respond\_to?**:

	rex.respond_to? :bark #=> false
	rex.bark #=> woofwoof!

It returns false, and that makes sense since the method doesn't really exist. Then it's my responsibility to change the method **respond\_to?** to work properly using my special rule. I'll change my class to this:

	class Dog
	  METHOD_BARK = /^bark/

	  def respond_to?(method)
	    return true if method.to_s =~ METHOD_BARK
	    super
	  end

	  def method_missing(method, *args, &block)
	    if method.to_s =~ METHOD_BARK
	      puts "woofwoof!"
	    else
	      super
	    end
	  end
	end

	rex = Dog.new
	rex.respond_to?(:bark) #=> true
	rex.bark #=> woofwoof!

Now we're talking! This is a common mistake that I've seen often including in the Rails codebase itself. Try to execute a  **respond\_to?** to check the existence of methods like **find\_by\_name**, for example.

Ruby is an amazing and highly flexible language, but if you don't watch it you can leave loose ends like these.

Of course that in Rails 2.1 this problem was fixed, you can use **respond\_to?** to check the existence of methods like **find\_by\_something**.
