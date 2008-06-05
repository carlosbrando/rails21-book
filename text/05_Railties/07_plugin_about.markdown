##Obtendo informações sobre um plugin

Aí está uma das novas funcionalidades do Rails 2.1 que provavelmente você nunca usará. Digo “talvez”, porque pode ser que em algum caso muito especifico seja interessante obter o número da versão do plugin, por exemplo.

Para testar isto, precisamos criar um novo arquivo chamado *about.yml* no diretório do plugin, algo mais ou menos assim:

	author: Carlos Brando
	version: 1.2.0
	description: Uma descrição qualquer sobre o plugin
	url: http://www.nomedojogo.com

Depois podemos recuperar estas informações via código, assim:

	plugin = Rails::Plugin.new(diretorio_do_meu_plugin)
	plugin.about["author"] # => “Carlos Brando”
	plugin.about["url"] # => “http://www.nomedojogo.com”

Se alguém encontrar algum uso para isto e quiser compartilhar comigo, talvez eu mude de idéia quanto à sua real necessidade.
