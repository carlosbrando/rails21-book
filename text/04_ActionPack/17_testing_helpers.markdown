## Testing Helpers in a simple way

One very boring thing to do in earlier versions of Rails was testing **helpers**. I already suffered a lot to ensure 100% of covering, creating tests for some **helpers**.

This became much more simpler in rails 2.1 with the **ActionView::TestCase** class. Look the example:

	module PeopleHelper
	  def title(text)
	    content_tag(:h1, text)
	  end

	  def homepage_path
	    people_path
	  end
	end

Now look how we can do the same in Rails 2.1:

	class PeopleHelperTest < ActionView::TestCase
	  def setup
	    ActionController::Routing::Routes.draw do |map|
	      map.people 'people', :controller => 'people', :action => 'index'
	      map.connect ':controller/:action/:id'
	    end
	  end

	  def test_title
	    assert_equal "<h1>Ruby on Rails</h1>", title("Ruby on Rails")
	  end

	  def test_homepage_path
	    assert_equal "/people", homepage_path
	  end
	end
