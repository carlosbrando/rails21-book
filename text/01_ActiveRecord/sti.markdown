## Armazenando o nome completo da classe ao usar STI

Patch de brasileiro e não é de qualquer brasileiro, é do meu colega de trabalho na Surgeworks, Rodrigo Kochenburger.

Neste patch o Rodrigo resolveu um problema que tínhamos ao usar models com namespace e STI. Nas suas próprias palavras:

Quando usamos models com namespace e STI, o ActiveRecord armazena apenas o nome da classe, sem o namespace (demodulized). Isto vai funcionar se todas as classes no STI estiverem no mesmo namespace, mas irá falhar em outros casos. Exemplo:

	class CollectionItem < ActiveRecord::Base; end
	class ComicCollection::Item < CollectionItem; end

	item = ComicCollection::Item.new
	item.type # => ‘Item’

	item2 = CollectionItem.find(item.id) # retorna um erro, porque não encontrou a classe Item

Este patch do Rodrigo adiciona uma nova opção de configuração que faz com que o ActiveRecord armazene o nome completo da classe.

Para ligar ou desligar esta funcionalidade você deve incluir ou alterar a seguinte linha no seu arquivo environment.rb:

	ActiveRecord::Base.store_full_sti_class = true

Por padrão esta funcionalidade estará ligada.