## action\_name

Agora para saber qual action foi chamada durante a execução de sua view ficou mais fácil, basta usar o método action\_name:

	<%= action_name %>

O retorno será o mesmo que pegar o params[:action], mas de uma forma mais elegante.
