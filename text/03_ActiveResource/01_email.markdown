## Usando e-mail como nome de usuário.

Alguns serviços usam o e-mail como nome do usuário, o que nos obrigaria a usar uma URL mais ou menos assim:

	http://ernesto.jimenez@negonation.com:pass@tractis.com

Mas isto gerava um problema, porque temos dois arrobas (@) e o interpretador se perde para entender isto. Por este motivo a forma de usar o **ActiveResource** foi estendida um pouco, afim de facilitar o uso de emails na autenticação. Agora você também pode fazer assim:

	class Person < ActiveResource::Base
	  self.site = “http://tractis.com“
	  self.user = “ernesto.jimenez@negonation.com“
	  self.password = “pass“
	end
