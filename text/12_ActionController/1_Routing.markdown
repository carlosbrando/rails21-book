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