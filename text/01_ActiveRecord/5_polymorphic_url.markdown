## Polymorphic url

Os helpers para URLs polimórficas são métodos usados para resolver de uma forma mais inteligente uma rota nomeada quando você tem uma instancia de um modelo do **ActiveRecord**.

Estes métodos são úteis quando você quer gerar uma URL correta para um recurso **RESTful** sem precisar saber exatamente qual é o tipo do registro em questão.

O funcionamento é bem simples, veja alguns exemplos (nos comentários estão as chamadas equivalentes, nas versões antigas):

	record = Article.find(:first)
	polymorphic_url(record)  #->  article_url(record)

	record = Comment.find(:first)
	polymorphic_url(record)  #->  comment_url(record)

	# ele também reconhece quando é um novo registro
	record = Comment.new
	polymorphic_url(record)  #->  comments_url()
	
Veja que o método reconhece o registro usado e monta a rota corretamente. Nested resources e namespaces também são suportados:

	polymorphic_url([:admin, @article, @comment])
	#-> vai devolver:
	admin_article_comment_url(@article, @comment)
	
Você também pode usar prefixos como new, edit e formatted, veja alguns exemplos:

	edit_polymorphic_path(@post)
	#=> /posts/1/edit

	formatted_polymorphic_path([@post, :pdf])
	#=> /posts/1.pdf
	