## ActiveRecord::Base.create accepts blocks

We are already used to **ActiveRecord::Base.new** accepting blocks. Now we can do the same thing in the **create** method:

	# Creating an object and passing it a block describing its attributes
	User.create(:first_name => 'Jamie') do |u|
	  u.is_admin = false
	end

We can also use the same method to create many objects at once:

	# Creating an array of new objects using a block.
	# The block is executed once for each of object that is created.
	User.create([{:first_name => 'Jamie'}, {:first_name => 'Jeremy'}]) do |u|
	  u.is_admin = false
	end

And it also works with associations:

	author.posts.create!(:title => "New on Edge") {|p| p.body = "More cool stuff!"}

	# ou

	author.posts.create!(:title => "New on Edge") do |p|
	  p.body = "More cool stuff!"
	end
