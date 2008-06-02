## ActionView::Helpers::FormHelper#Fields\_for e ActionView::Helpers::FormHelper#Form\_for com a opção index.

Os métodos **ActionView::Helpers::FormHelper#Fields\_for** e **ActionView::Helpers::FormHelper#Form\_for** receberam a opção **:index**, removendo a necessidade de usar o **:index => nil** em cada objeto do formulário. Veja os exemplos:

O código ficava assim:

	<% fields_for “project[task_attributes][]“, task do |f| %>
	  <%= f.text_field :name, :index => nil %>
	  <%= f.hidden_field :id, :index => nil %>
	  <%= f.hidden_field :should_destroy, :index => nil %>
	<% end %>

Agora fica assim:

	<% fields_for “project[task_attributes][]“, task,
	              :index => nil do |f| %>
	  <%= f.text_field :name %>
	  <%= f.hidden_field :id %>
	  <%= f.hidden_field :should_destroy %>
	<% end %>