## excerpt

O método excerpt é um helper que funciona assim:

	excerpt(‘This is an example‘, ‘an‘, 5)
	# => “…s is an examp…”
	
Eu pedi para que ele localizasse dentro da frase “This is an example” a palavra “an” e me retornasse uma abreviação da frase com os cinco caracteres antes e depois da palavra, acrescentando quando necessário o sinal de “…”. 

O problema é que se você contar verá que depois a palavra ele trouxe na verdade seis caracteres e não cinco. BUG.

Esse bug foi corrigido. Veja o exemplo do funcionamento correto desse método:

	excerpt(‘This is an example‘, ‘an‘, 5)
	# => “…s is an exam…”