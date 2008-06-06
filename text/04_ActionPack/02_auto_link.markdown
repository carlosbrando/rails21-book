## Auto Link

Para quem não conhece, o método **auto\_link** recebe um texto qualquer como parâmetro e se o texto tiver algum endereço de email ou de um site ele retorna o mesmo texto com hyperlinks.

Por exemplo:

	auto_link("Acesse este endereço: http://www.rubyonrails.com")
	# => Acesse este endereço: http://www.rubyonrails.com

Acontece que alguns sites como o Amazon estão usando também o sinal de "=" (igual) em suas URLs, e este método não reconhece este sinal. Veja como o método se comporta neste caso:

	auto_link("http://www.amazon.com/Testing/ref=pd_bbs_sr_1")
	# => http://www.amazon.com/Testing/ref

Note que o método terminou o hyperlink exatamente antes do sinal de "=", pois ele não suporta este sinal. Quer dizer, não suportava. Nesta nova versão do Rails já temos este problema resolvido.

O mesmo método foi alterado mais tarde para também permitir o uso de URLs com o sinal de parênteses.

Um exemplo de URL com parênteses:

	http://en.wikipedia.org/wiki/Sprite_(computer_graphics)
