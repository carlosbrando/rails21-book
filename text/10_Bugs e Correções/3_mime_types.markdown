##Mime Types

Foi corrigido um bug que não permitia determinar o mime type atribuido ao **request.formt** usando um símbolo. Agora o código abaixo já pode ser utilizado.

	request.format = :iphone
	assert_equal :iphone, request.format
