## ActionController::Routing

### Map.root
Now, when using **map.root** you can be much more **DRY** using an alias for that.

In the earlier versions of rails you used to do it like this:

	map.new_session :controller => 'sessions', :action => 'new'
	map.root :controller => 'sessions', :action => 'new'
	
Now you can do it this way:

	map.new_session :controller => 'sessions', :action => 'new'
	map.root :new_session
	
### Routes recognition 
Routes recognition's old implementation used to sweep all routes, one by one, and often turned to be very time consuming. A new and smarter implementation was developed. It creates a tree for routes and the route recognition is made by prefixing, skipping similar routes. This approach lowers recognition time in approximately 2.7 times. 

All the new implementations are in the file **recognition\_optimisation.rb** and its working details are well explained in the comments. See the the documentation inside the source code itself for more information about its implementation.

### Assert_routing

Now it's possible to test a route with an HTTP method. Look at the following example:

	assert_routing({ :method => 'put',
	                 :path => '/product/321' },
	               { :controller => "product",
	                 :action => "update",
	                 :id => "321" })
	
### Map.resources
	
Imagine you have a site written in a language other than english, and you want to taylor your routes to use the same language. In other words, instead of having:

	http://www.mysite.com.br/products/1234/reviews

You wished to have something like this:

	http://www.mysite.com.br/produtos/1234/comentarios

This was already possible, but not in a simple way and without compromising some rails conventions.

Now we have the option **:as** within **map.resources** to personalize our routes. Look our example to get the URL above in portuguese:

	map.resources :products, :as => 'produtos' do |product|
	  # product_reviews_path(product) ==
	  # '/produtos/1234/comentarios’
	  product.resources :product_reviews, :as => 'comentarios'
	end