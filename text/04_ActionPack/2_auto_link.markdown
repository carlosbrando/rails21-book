## Auto Link

Para quem não conhece, o método **auto\_link** recebe um texto qualquer como parâmetro e se o texto tiver algum endereço de email ou de um site ele retorna o mesmo texto com hyperlinks.

Por exemplo:

	auto_link("Acesse este endereço: http://www.rubyonrails.com")
	# => Acesse este endereço: http://www.rubyonrails.com

Acontece que alguns sites como o Amazon estão usando também o sinal de "=" (igual) em suas URLs, e este método não reconhece este sinal. Veja como o método se comporta neste caso:

	auto_link("Acesse este endereço: http://www.amazon.com/Testing-Equal-Sign-In-Path/ref=pd_bbs_sr_1?ie=UTF8&s=books&qid=1198861734&sr=8-1")
	# => Acesse este endereço: http://www.amazon.com/Testing-Equal-Sign-In-Path/ref=pd_bbs_sr_1?ie=UTF8&s=books&qid=1198861734&sr=8-1

Note que o método terminou o hyperlink exatamente antes do sinal de "=", pois ele não suporta este sinal. Quer dizer, não suportava. Nesta nova versão do Rails já temos este problema resolvido.
