## Aplicando formatação de título em strings

Existia um bug no método **String#titleize** quando tentávamos usá-lo em uma string que continha o 's. Faça um teste no console de sua aplicação Rails executando o código abaixo:

	>> "brando's blog".titleize
	#=> "Brando'S Blog"

Notou que o 's retornou maiúsculo? Este problema foi corrigido. Se você executar o mesmo código na nova versão do Rails, o retorno será o texto correto: "Brando's Blog".
