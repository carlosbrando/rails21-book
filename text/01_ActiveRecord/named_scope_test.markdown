## Testando named\_scope com proxy\_options

Uma novidade legal no Rails 2.1, que inclusive já foi assunto desta série é o named\_scope. Depois de "brincar" um pouco com este recurso, fomos descobrindo que era muito difícil testar se o escopo estava sendo gerado corretamente, principalmente quando usávamos estruturas mais complexas.

Veja um exemplo:

	class Shirt < ActiveRecord::Base
	  named_scope :colored, lambda { |color|
	    { :conditions => { :color => color } }
	  }
	end

Como criar um teste que valide a geração correta do escopo?

Para facilitar isto foi criado o método proxy\_options, que permite examinar as opções que estão sendo usadas no named\_scope. Para testar o exemplo acima, poderíamos fazer assim:

	class ShirtTest < Test::Unit
	  def test_colored_scope
	    red_scope = { :conditions => { :colored => 'red' } }
	    blue_scope = { :conditions => { :colored => 'blue' } }
	    assert_equal red_scope, Shirt.colored('red').scope_options
	    assert_equal blue_scope, Shirt.colored('blue').scope_options
	  end
	end
