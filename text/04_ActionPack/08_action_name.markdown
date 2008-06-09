## action\_name

Now, to know which view was called during running time of your view, we just use the **action\_name** method:

	<%= action_name %>

The return value will be the same as using **params[:action]**, but in a more elegant way.
