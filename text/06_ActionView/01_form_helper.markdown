## ActionView::Helpers::FormHelper

### fields\_for form\_for with index option.

The **#fields\_for** and **form\_for** methods received the **:index** option, removing the need of using **:index => nil** on each form object. Look the examples:

This is the way code used to be:

	<% fields_for "project[task_attributes][]", task do |f| %>
	  <%= f.text_field :name, :index => nil %>
	  <%= f.hidden_field :id, :index => nil %>
	  <%= f.hidden_field :should_destroy, :index => nil %>
	<% end %>

Now it looks like this:

	<% fields_for "project[task_attributes][]", task,
	              :index => nil do |f| %>
	  <%= f.text_field :name %>
	  <%= f.hidden_field :id %>
	  <%= f.hidden_field :should_destroy %>
	<% end %>