## json escape

O método json\_escape funciona como o html\_escape. É muito útil para quem precisa exibir strings JSON em uma página HTML, como no caso de uma documentação, por exemplo.

	puts json_escape(“is a > 0 & a < 10?“)
	# => is a \u003E 0 \u0026 a \u003C 10?

Também podemos usar o atalho j no ERB:

	<%= j @person.to_json %>

Se quiser que todo o código JSON seja “escapado” por padrão, incluía a seguinte linha no seu arquivo environment.rb:

	ActiveSupport.escape_html_entities_in_json = true
