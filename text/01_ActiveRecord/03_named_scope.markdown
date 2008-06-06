## Named_scope

O gem *has\_finder* foi incorporado ao Rails, mas com um nome diferente: **named\_scope**.

Para entender o que isto acrescentou de novo ao Rails veja os exemplos abaixo:

	class Article < ActiveRecord::Base
	  named_scope :published, :conditions => {:published => true}
	  named_scope :containing_the_letter_a, :conditions => "body LIKE '%a%’"
	end 

	Article.published.paginate(:page => 1)
	Article.published.containing_the_letter_a.count
	Article.containing_the_letter_a.find(:first)
	Article.containing_the_letter_a.find(:all, :conditions => {…})

Ao invés de criar um método **published** para retornar os posts já publicados, estou usando o **named\_scope** para fazer isto. Mas o método é um pouco mais robusto do que isto. Veja mais alguns exemplos de como ele pode ser usado:

	named_scope :written_before, lambda { |time|
	  { :conditions => ['written_on < ?', time] }
	}

	named_scope :anonymous_extension do
	  def one
	    1
	  end
	end

	named_scope :named_extension, :extend => NamedExtension 

	named_scope :multiple_extensions, 
		:extend => [MultipleExtensionTwo, MultipleExtensionOne]

## Testando named\_scope com proxy\_options

**Named scopes** é uma novidade muito interessante no Rails 2.1, mas após usar por um tempo este recurso, você pode descobrir que criar testes para estruturas mais complexas pode ser muito díficil.

Vamos pegar um exemplo:

		class Shirt < ActiveRecord::Base
		  named_scope :colored, lambda { |color|
		    { :conditions => { :color => color } }
		  }
		end

Como criar um teste que valide a geração correta do escopo?

Para facilitar isto foi criado o método **proxy\_options**, que permite examinar as opções que estão sendo usadas no **named\_scope**. Para testar o exemplo acima, poderíamos fazer assim:

		class ShirtTest < Test::Unit
		  def test_colored_scope
		    red_scope = { :conditions => { :colored => 'red' } }
		    blue_scope = { :conditions => { :colored => 'blue' } }
		    assert_equal red_scope, Shirt.colored('red').scope_options
		    assert_equal blue_scope, Shirt.colored('blue').scope_options
		  end
		end
