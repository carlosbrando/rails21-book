## A new way of using partials

Something very common in Rails software development is the use of **partials** to avoid code repetition. Look an example of use:

	<% form_for :user, :url => users_path do %>
		<%= render :partial => 'form' %>
		<%= submit_tag 'Create' %>
	<% end %>

**Partial** is a code fragment (a template). The advantage of using an **partial** is to avoid unnecessary code repetition. Using a **partial** is very simple, you can start with something like this: **render :partial => "name"**. After, you must create a file with the same name of your **partial**, but using a underscore in front of it. Just that.

The above code is the way we are used to do, but in this new Rails version, we'll do the same thing in a different way, like this:

	<% form_for(@user) do |f| %>
		<%= render :partial => f %>
		<%= submit_tag 'Create' %>
	<% end %>

In this example we render the partial "users/\_form", which will receive a variable called "form" with the references created by the **FormBuilder**.

The old way will keep working.
