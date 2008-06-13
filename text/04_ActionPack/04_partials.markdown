## A new way of using partials

Something very common in Rails software development is the use of **partials** to avoid code repetition. Here is a usage example:

	<% form_for :user, :url => users_path do %>
		<%= render :partial => 'form' %>
		<%= submit_tag 'Create' %>
	<% end %>

**Partial** is a code fragment (a template). The advantage of using a **partial** is to avoid unnecessary code repetition. Using a **partial** is very simple, you can start with something like this: **render :partial => "name"**. You must create a file with the same name of your **partial**, but using an underscore in front of it.

The code above shows ho we are used to do it, in Rails 2.1 you'll do the same thing in a slightly different way:

	<% form_for(@user) do |f| %>
		<%= render :partial => f %>
		<%= submit_tag 'Create' %>
	<% end %>

In this example we render the partial "users/\_form", which will receive a variable called "form" with the references created by the **FormBuilder**.

The old way will continue to work in Rails 2.1.
