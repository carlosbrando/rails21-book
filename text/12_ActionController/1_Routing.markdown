## Routing

### Map.root

Agora na hora de informar o **map.root** você pode ser um pouco mais **DRY** usando um alias para isto. Se antes você fazia assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :controller => ‘sessions‘, :action => ‘new‘
	
Agora você pode fazer assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :new_session
	
Ou assim:

	map.dashboard ‘/dashboard‘, :controller=>‘dashboard‘
	map.root :dashboard
	
### Reconhecimento de rotas

A antiga implementação do reconhecimento de rotas percorria todas as rotas, uma-a-uma, e isto consumia muito tempo. Uma nova implementação foi desenvolvida e é mais inteligente, ela monta uma árvore de rotas e reconhece as rotas pelo prefixo, pulando rotas semelhantes. Só isto já diminui em aproximadamente 2.7 vezes o tempo de reconhecimento das rotas.

Toda a nova implementação está no arquivo **recognition\_optimisation.rb**, os detalhes de seu funcionamento estão bem explicados nos comentários. Para mais informações sobre isto veja a documentação no próprio código fonte.

### Assert_routing

Agora é possível testar uma rota com um método HTTP. Veja o exemplo:

	assert_routing({ :method => ‘put‘,
	                 :path => ‘/product/321‘ },
	               { :controller => “product“,
	                 :action => “update“,
	                 :id => “321“ })
	

### Map.resources
	
Imagine o seguinte cenário, você tem um site todo em português e que deixar seus rotas também em português para facilitar a vida de seus usuários. Em outras palavras ao invés de ter algo como:

	http://www.meusite.com.br/products/1234/reviews

Você gostaria de ter algo assim:

	http://www.meusite.com.br/produtos/1234/comentarios

Isto era possível nas versões anteriores, mas não de uma forma muito simples, não pelo menos sem comprometer algumas convenções do Rails.

Agora ganharemos a opção **:as** no **map.resources** para personalizar nossas rotas. Veja um exemplo, para conseguir a URL acima totalmente em português:

	map.resources :products, :as => ‘produtos‘ do |product|
	  # product_reviews_path(product) ==
	  # ‘/produtos/1234/comentarios’
	  product.resources :product_reviews, :as => ‘comentarios‘
	end