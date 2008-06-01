## Fields\_for e Form\_for com a opção index.


Nas versões anteriores era necessário fazer uma gambiarra incluindo um **:index => nil** em cada objeto de um formulário para impedir que o **Rails** acrescentasse o **ID** do registro no nome do objeto (**project[task_attributes][41][name]**) quando na verdade desejava-se sem o ID (**project[task_attributes][][name]**).

O código ficava mais ou menos assim:

	<% fields_for “project[task_attributes][]“, task do |f| %>
	  <%= f.text_field :name, :index => nil %>
	  <%= f.hidden_field :id, :index => nil %>
	  <%= f.hidden_field :should_destroy, :index => nil %>
	<% end %>
	
Para evitar este tipo de sujeira a opção **:index** foi incluída também no **form\_for** e no **fields\_for**. Assim fica mais fácil e limpo:

	<% fields_for “project[task_attributes][]“, task,
	              :index => nil do |f| %>
	  <%= f.text_field :name %>
	  <%= f.hidden_field :id %>
	  <%= f.hidden_field :should_destroy %>
	<% end %>