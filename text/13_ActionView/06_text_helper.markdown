## ActionView::Helpers::TextHelper

### excerpt

O método **excerpt** é um helper para localizar uma palavra dentro de uma frase e retornar uma abreviação desta frase com o número de caracteres passado como parâmetro antes e depois da palavra, acrescentando, quando necessário, “…”. Veja este exemplo:

	excerpt(‘This is an example‘, ‘an‘, 5)
	# => “…s is an examp…”
	
O problema é que existia um BUG. Se você contar verá que depois a palavra ele trouxe na verdade seis caracteres e não cinco. Esse bug foi corrigido. Veja o exemplo do funcionamento correto desse método:

	excerpt(‘This is an example‘, ‘an‘, 5)
	# => “…s is an exam…”
	
###simple\_format

O método **simple\_format** basicamente recebe como parâmetro um texto qualquer e o formata de uma forma simples em HTML. O que ele faz é pegar o texto e substituir uma quebra de linha (\n) pela tag "< br />". E quando temos duas quebras de linha seguidas (\n\n) ele separa o texto entre parágrafos, usando a tag "< p>".

No Rails 2.1 este método recebe um novo parâmetro opcional. Além do texto poderemos também informar quais atributos HTML gostaríamos que a tag "< p>" tivesse. Vamos aos exemplos:

	simple_format(“Oi mãe!“, :class => ‘description‘)
	# => “<p class=’description’>Oi mãe!</p>”

Os atributos HTML informados serão acrescentados em todas as tags "< p>" criadas pelo método.