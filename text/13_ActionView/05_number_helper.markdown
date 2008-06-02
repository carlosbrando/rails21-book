## ActionView::Helpers::NumberHelper

### number\_to\_currency

O método **number\_to\_currency** passou a aceitar a opção **:format** como parâmetro, permitindo a formatação do valor retornado pelo método. Nas versões anteriores, na hora de formatarmos valores em reais precisamos incluir um espaço na frente da opção **:unit** para que o formato ficasse correto. Veja os exemplos:

	number_to_currency(9.99, :separator => “,“, :delimiter => “.“, :unit => “R$“)
	# => “R$9,99″

	number_to_currency(9.99, :format => “%u %n“, :separator => “,“, :delimiter => “.“, :unit => “R$“)
	# => “R$ 9,99″
	
Além disto, podemos personalizar de outras formas, por exemplo:

	number_to_currency(9.99, :format => “%n em reais“, :separator => “,“, :delimiter => “.“, :unit => “R$“)
	# => “9,99 em reais”

Ao montar sua própria string de formatação, você pode usar os seguintes parâmetros:

	%u Para a unidade monetária
	%n Para o número