## Acessando Helpers fora das Views

Aí está mais uma alteração que gostei. Quantas vezes eu não criei um helper e depois quis usá-lo dentro do meu controller… Para conseguir isto só incluindo o módulo do mesmo no controller, mas isto sempre me deixava com uma sensação de sujeira.

Para o Rails 2.1 foi criado um proxy para acessar os helpers de fora das views. Funciona de maneira muito simples:

	# Para acessar o método simple_format, por exemplo
	ApplicationController.helpers.simple_format(text)

Simples e limpo!
