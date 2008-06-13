## Labels

When creating a new form using **scaffold** it will be created with the following code:

	<% form_for(@post) do |f| %>
	  <p>
	    <%= f.label :title %><br />
	    <%= f.text_field :title %>
	  </p>
	  <p>
	    <%= f.label :body %><br />
	    <%= f.text_area :body %>
	  </p>
	  <p>
	    <%= f.submit "Update" %>
	  </p>
	<% end %>

The **label** method was included. This method returns a *string* with the column title inside an HTML **\<label\>** tag.

	>> f.label :title
	=> <label for="post_title">Title</label>

	>> f.label :title, "A short title"
	=> <label for="post_title">A short title</label>

	>> label :title, "A short title", :class => "title_label"
	=> <label for="post_title" class="title_label">A short title</label>

Did you notice the **for** parameter inside the tag ? "post\_title" is the textbox title which contains our post title. The **\<label\>** tag is in fact a label associated to the **post\_title** object. When someone clicks on the label (which isn't a link) the associated HTML controller receives focus.

Robby Russell wrote an interesting post in his blog about this subject. You can read it on: [http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label](http://www.robbyonrails.com/articles/2007/12/02/that-checkbox-needs-a-label)

Also included was the **label\_tag** method in **FormTagHelper**. This method works like label, but in a simpler way:

	>> label_tag 'name'
	=> <label for="name">Name</label> 

	>> label_tag 'name', 'Your name'
	=> <label for="name">Your name</label> 

	>> label_tag 'name', nil, :class => 'small_label'
	=> <label for="name" class="small_label">Name</label>

The method also accepts the **:for** option, Look an example:

	label(:post, :title, nil, :for => "my_for")

This will return something like this:

	<label for="my_for">Title</label>
