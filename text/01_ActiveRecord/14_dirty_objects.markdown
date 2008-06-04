## Dirty Objects

Agora no Rails podemos rastrear alterações feitas no **ActiveRecord**. Podemos saber se um objeto foi alterado ou não e se foi alterado podemos identificar o que mudou e até mesmo fazer um comparativo do tipo antes e depois. Vamos aos exemplos:

	article = Article.find(:first)
	article.changed?  #=> false

	article.title  #=> "Title"
	article.title = "New Title"
	article.title_changed? #=> true

	# Recupera o valor anterior do atributo
	article.title_was  #=> "Title"

	# Veja o antes de depois da alteração
	article.title_change  #=> ["Title", "New Title"]

Como você pode ver é bem simples. Você também pode listar todas as alterações no objeto de duas formas. Continuando do código anterior:

	# Devolve uma lista com os atributos alterados
	article.changed  #=> ['title']

	# Devolve um Hash com os atributos alterados e um antes e depois
	article.changes  #=> { 'title’ => ["Title", "New Title"] }

Note que quando o objeto é salvo, o status dele é alterado. Veja:

	article.changed?  #=> true
	article.save  #=> true
	article.changed?  #=> false

Caso você vá alterar um objeto sem usar o operador **attr=**, você precisará informar manualmente que o atributo foi alterado usando o método **attr\_name\_will\_change!** (no lugar de **attr**, vai o nome do atributo), veja mais um último exemplo:

	article = Article.find(:first)
	article.title_will_change!
	article.title.upcase!
	article.title_change  #=> ['Title', 'TITLE']
