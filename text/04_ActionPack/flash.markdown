## flash.now agora funciona em testes

Também já quebrei a cabeça por causa disto. O problema é que durante os testes você nunca podia confirmar se uma mensagem foi armazenada no flash, porque ela era limpa pelo Rails antes de cair no seu script de teste.

No Rails 2.1 este problema foi resolvido. Agora você pode incluir linhas como esta em seus testes:

	assert_equal '>value_now<', flash['test_now']