## Uma nova forma de usar partials

Algo muito normal no desenvolvimento de softwares em Rails é o uso de **partials** para evitar a repetição de código. Vejamos um exemplo de seu uso:

	<% form_for :user, :url => users_path do %>
		<%= render :partial => 'form' %>
		<%= submit_tag 'Create' %>
	<% end %>

**Partial** é um fragmento de código (um template). A vantagem de se usar uma **partial** é evitar a repetição desnecessária de código. Para usar uma **partial** é muito simples, você pode começar com algo mais ou menos assim: **render :partial => "name"**. Depois deve criar um arquivo com o mesmo nome da **partial**, mas com um underscore na frente, só isso.

O código acima é a forma como estamos acostumados a fazer hoje, mas nesta nova versão do Rails, faremos a mesma coisa de uma forma um pouco diferente, assim:

	<% form_for(@user) do |f| %>
		<%= render :partial => f %>
		<%= submit_tag 'Create' %>
	<% end %>

Neste exemplo nós vamos renderizar a partial "users/\_form", que receberá uma variável chamada form com as referências criadas pelo **FormBuilder**.

A forma antiga também vai continuar funcionando.
