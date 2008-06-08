## ActionController::Caching::Sweeping

In the earlier versions of rails, when we were declaring a **sweeper**, we had to inform the class using symbols:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper :list_sweeper,
	                :only => [ :edit, :destroy, :share ]
	end
	
Now it's possible to explicit declare a class instead of using a symbol. This is necessary if your **sweeper** is inside a module for example. Though you can still use symbols for other cases, from now on you can also do it this way:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper OpenBar::Sweeper,
	                :only => [ :edit, :destroy, :share ]
	end