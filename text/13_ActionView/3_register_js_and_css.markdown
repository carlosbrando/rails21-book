## Register\_javascript\_expansion e register\_stylesheet\_expansion

Dois novos **helpers** foram criados para facilitar na hora de criar um plugin.

### register\_javascript\_expansion

Este método registra um ou mais arquivos javascript para serem incluídos quando um símbolo, determinado por você, for passado como parâmetro para o método **javascript\_include\_tag**. A idéia é que este método seja chamado no arquivo **init.rb** do seu plugin para registrar os arquivos javascript que seu plugin instalou na pasta **public/javascripts**. Veja como funciona:

	# No arquivo init.rb
	ActionView::Helpers::AssetTagHelper.register_javascript_expansion :monkey => ["head", "body", "tail"] 

	# Depois, fazendo assim:
	javascript_include_tag :monkey # =>

	# Terei isto:
	<script type=“text/javascript“ src=“/javascripts/head.js“></script>
	<script type=“text/javascript“ src=“/javascripts/body.js“></script>
	<script type=“text/javascript“ src=“/javascripts/tail.js“></script>

### register\_stylesheet\_expansion 

Este método faz exatamente a mesma coisa que o método acima, mas criando um símbolo para ser usado nas chamadas ao método **stylesheet\_link\_tag**. Veja um exemplo:

	# No arquivo init.rb
	ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :monkey => ["head", "body", "tail"] 

	# Depois, fazendo assim:
	stylesheet_link_tag :monkey

	# Terei isto:
	<link href=“/stylesheets/head.css“  media=“screen“ rel=“stylesheet“ type=“text/css“ />
	<link href=“/stylesheets/body.css“  media=“screen“ rel=“stylesheet“ type=“text/css“ />
	<link href=“/stylesheets/tail.css“  media=“screen“ rel=“stylesheet“ type=“text/css“ />