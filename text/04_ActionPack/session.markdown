## session(:on)

Talvez você não conheça mas no Rails é possível desligar o uso de sessões assim:

	class ApplicationController < ActionController::Base
	  session :off
	end

Veja que no exemplo acima estou desligando a sessão para todos os controllers (ApplicationController), mas eu também poderia fazer isto para apenas um controller específico.

Mas e se eu quiser que um controller "ligue" o uso de sessões para ele? No Rails 2.1 o método aceitará a opção :on, assim:

	class UsersController < ApplicationController
	  session :on
	end
