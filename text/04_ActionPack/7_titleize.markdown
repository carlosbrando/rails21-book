## Aplicando formatação de título em strings

Existia um bug ao se utilizar o método **String#titleize** em uma string que continha 's. O bug retornava o 's maiúsculo. Veja um exemplo:

	>> “brando’s blog“.titleize
	=> “Brando’S Blog“
	
Veja como ficou o mesmo exemplo só que agora com a correção desse bug.

	>> “brando’s blog“.titleize
	=> “Brando’s Blog“
