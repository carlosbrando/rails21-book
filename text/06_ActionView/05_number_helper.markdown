## ActionView::Helpers::NumberHelper

### number\_to\_currency

The **number\_to\_currency** method now accepts the **:format** option as a parameter, letting us to format the method's returning value. In earlier versions, when we had to format values for our local currency, we needed to include a space in front of **:unit** option to make the output format correct. See the examples:
	
	# R$ is the symbol for Brazilian currency
	number_to_currency(9.99, :separator => ",", :delimiter => ".", :unit => "R$")
	# => "R$9,99″

	number_to_currency(9.99, :format => "%u %n", :separator => ",", 
		:delimiter => ".", :unit => "R$")
	# => "R$ 9,99″
	
Besides that, we can customize in other forms, for example:

	number_to_currency(9.99, :format => "%n in Brazilian reais", :separator => ",", 
		:delimiter => ".", :unit => "R$")
	# => "9,99 em reais"

When creating your own formatting string, you can use the following parameters:

	%u For the currency
	%n For the number