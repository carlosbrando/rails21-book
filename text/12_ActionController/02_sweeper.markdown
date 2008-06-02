## Sweeper

Nas versões anteriores, quando íamos declarar um **sweeper** tínhamos de informar a classe usando símbolos, assim:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper :list_sweeper,
	                :only => [ :edit, :destroy, :share ]
	end
	
Agora é possível declarar explicitamente uma classe ao invés de usar um símbolo. Isto é necessário se o seu **sweeper** estiver em um módulo, por exemplo. Embora você possa continuar usando símbolos para os demais casos, a partir de agora você também pode fazer assim:

	class ListsController < ApplicationController
	  caches_action :index, :show, :public, :feed
	  cache_sweeper OpenBar::Sweeper,
	                :only => [ :edit, :destroy, :share ]
	end