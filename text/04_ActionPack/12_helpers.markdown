## Acessando Helpers fora das Views

Quantas vezes você não criou um **helper** e depois quis usá-lo dentro do meu **controller**? Para conseguir isto só incluindo o módulo do **helper** no **controller**, mas isto sempre deixa seu código com aparência de sujo.

Para o Rails 2.1 foi criado um proxy para acessar os helpers de fora das views. Funciona de maneira muito simples:

	# Para acessar o método simple_format, por exemplo
	ApplicationController.helpers.simple_format(text)

Simples e limpo!
