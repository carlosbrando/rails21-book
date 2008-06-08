## Partial Updates

The implementation of **Dirty Objects** was the starting point for another very interesting functionality.
                                                                                                         
Since we can now track down what has changed in an object state, why not use it to avoid unnecessary updates to the database ?
  
On previous versions of Rails when we called **save** from an already existing **ActiveRecord** object, all of its fields would be updated in the database.

This action could be greatly enhanced with the use of **Dirty Objects** and it is exactly what happened. Take a loot at the SQL query generated when trying to save an object that suffered a slight change in Rails 2.1 

Com o **Dirty Objects** isto poderia ser melhorado, e foi exatamente o que aconteceu. Veja o SQL gerado ao tentar salvar um registro que sofreu apenas uma leve alteração no Rails 2.1:

	article = Article.find(:first)
	article.title  #=> "Title"
	article.subject  #=> "Edge Rails"

	# Vamos atualizar um atributo…
	article.title = "New Title"

	# Veja o SQL criado ao persistir o objeto
	article.save
	#=>  "UPDATE articles SET title = 'New Title’ WHERE id = 1″

Note que apenas o atributo alterado será atualizado no banco de dados. Se nenhum atributo fosse alterado, o **ActiveRecord** não executaria nenhum update.

Para habilitar/desabilitar esta nova funcionalidade você deve alterar a propriedade **partial\_updates** dos seus **models**.

	# Para habilitar a funcionalidade…
	MinhaClasse.partial_updates = true

Se deseja habilitar/desabilitar esta funcionalidade para todos os models do seu sistema altere esta linha no arquivo *config/initializers/new\_rails\_defaults.rb*:

	# Habilitando para todos os meus models
	ActiveRecord::Base.partial_updates = true

Atenção: Não se esqueça de informar o *config/initializers/new\_rails\_defaults.rb* quando for alterar um atributo sem usar o método **attr=**, assim:

	# Se eu fizer assim, tudo bem…
	person.name = 'bobby'
	person.name_change    # => ['bob', 'bobby']
	
	
	# Mas se eu não alterar o atributo usando o sinal de '=’
	# então preciso avisar que vou fazer uma alteração
	person.name_will_change!
	person.name << 'by'
	person.name_change    # => ['bob', 'bobby']

Se não fizer isto este tipo de alteração não será rastreado, e sua tabela não será atualizada corretamente.
