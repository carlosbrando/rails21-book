## action\_name

In order to find out which view was called during running time of your view, we can use the **action\_name** method:

	<%= action_name %>

The return value will be the same as using **params[:action]**, but in a more elegant way.
