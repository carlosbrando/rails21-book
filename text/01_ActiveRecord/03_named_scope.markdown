## Named_scope
              
The *has\_finder* gem has been added to Rails with a different name: **named\_scope**.
                       
To fully understand what this adition brought to Rails let's look at the following the examples:

	class Article < ActiveRecord::Base
	  named_scope :published, :conditions => {:published => true}
	  named_scope :containing_the_letter_a, :conditions => "body LIKE '%a%’"
	end 

	Article.published.paginate(:page => 1)
	Article.published.containing_the_letter_a.count
	Article.containing_the_letter_a.find(:first)
	Article.containing_the_letter_a.find(:all, :conditions => {…})
 
Instead of creating a new method named **published** to return all published posts, I'm using a **named\_scope** to do it for me. But it can go even further. Let's look at another example of how it can be used:

	named_scope :written_before, lambda { |time|
	  { :conditions => ['written_on < ?', time] }
	}

	named_scope :anonymous_extension do
	  def one
	    1
	  end
	end

	named_scope :named_extension, :extend => NamedExtension 

	named_scope :multiple_extensions, 
		:extend => [MultipleExtensionTwo, MultipleExtensionOne]

## Testing named\_scope with proxy\_options 
                                                                                 
**Named scopes** is a very interesting new option for Rails 2.1, but after using it awhile you might have a hard time creating tests for more complex situations.

Let's look at an example:

		class Shirt < ActiveRecord::Base
		  named_scope :colored, lambda { |color|
		    { :conditions => { :color => color } }
		  }
		end

How to create a test to validate the generation of the scope ?

To solve this issue, the method **proxy\_options** was created. It allows us to examine the options used in **named_scope**. To test the code above we could write:

		class ShirtTest < Test::Unit
		  def test_colored_scope
		    red_scope = { :conditions => { :colored => 'red' } }
		    blue_scope = { :conditions => { :colored => 'blue' } }
		    assert_equal red_scope, Shirt.colored('red').scope_options
		    assert_equal blue_scope, Shirt.colored('blue').scope_options
		  end
		end
