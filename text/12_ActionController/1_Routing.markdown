## Routing

Agora na hora de informar o **map.root** você pode ser um pouco mais **DRY** usando um alias para isto. Se antes você fazia assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :controller => ‘sessions‘, :action => ‘new‘
	
Agora você pode fazer assim:

	map.new_session :controller => ‘sessions‘, :action => ‘new‘
	map.root :new_session
	
Ou assim:

	map.dashboard ‘/dashboard‘, :controller=>‘dashboard‘
	map.root :dashboard