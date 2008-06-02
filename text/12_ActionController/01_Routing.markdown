## Routing

### Map.root

Agora na hora de informar o **map.root** você pode ser um pouco mais **DRY** usando um alias para isto. 

Nas versões anteriores do Rails você fazia assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :controller => ‘sessions‘, :action => ‘new‘
	
Agora você pode fazer assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :new_session
	
### Reconhecimento de rotas

A antiga implementação do reconhecimento de rotas percorria todas as rotas, uma-a-uma, e isto consumia muito tempo. Uma nova implementação mais inteligente foi desenvolvida onde se cria uma árvore de rotas e o reconhecimento é feito pelo prefixo, pulando rotas semelhantes. Isto já diminui em aproximadamente 2.7 vezes o tempo de reconhecimento.

Toda a nova implementação está no arquivo **recognition\_optimisation.rb** e os detalhes de seu funcionamento estão bem explicados nos comentários. Para mais informações sobre isto veja a documentação no próprio código fonte.

### Assert_routing

Agora é possível testar uma rota com um método HTTP. Veja o exemplo:

	assert_routing({ :method => ‘put‘,
	                 :path => ‘/product/321‘ },
	               { :controller => “product“,
	                 :action => “update“,
	                 :id => “321“ })
	

### Map.resources
	
Imagine que você tem um site todo em português e quer deixar suas rotas no mesmo idioma. Em outras palavras ao invés de ter algo como:

	http://www.meusite.com.br/products/1234/reviews

Você gostaria de ter algo assim:

	http://www.meusite.com.br/produtos/1234/comentarios

Isto já era possível, mas não de uma forma muito simples, não pelo menos sem comprometer algumas convenções do Rails.

Agora ganharemos a opção **:as** no **map.resources** para personalizar nossas rotas. Veja um exemplo, para conseguir a URL acima totalmente em português:

	map.resources :products, :as => ‘produtos‘ do |product|
	  # product_reviews_path(product) ==
	  # ‘/produtos/1234/comentarios’
	  product.resources :product_reviews, :as => ‘comentarios‘
	end