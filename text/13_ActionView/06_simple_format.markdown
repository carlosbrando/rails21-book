## ActionView::Helpers::TextHelper#simple\_format

O método **simple\_format** basicamente recebe como parâmetro um texto qualquer e o formata de uma forma simples em HTML. O que ele faz é pegar o texto e substituir uma quebra de linha (\n) pela tag "< br />". E quando temos duas quebras de linha seguidas (\n\n) ele separa o texto entre parágrafos, usando a tag "< p>".

No Rails 2.1 este método recebe um novo parâmetro opcional. Além do texto poderemos também informar quais atributos HTML gostaríamos que a tag "< p>" tivesse. Vamos aos exemplos:

	simple_format(“Oi mãe!“, :class => ‘description‘)
	# => “<p class=’description’>Oi mãe!</p>”

Os atributos HTML informados serão acrescentados em todas as tags "< p>" criadas pelo método.