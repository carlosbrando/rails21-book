## Find

### Conditions

A partir de agora é possível passar um objeto como parâmetro no método **find** de uma classe **ActiveRecord**. Veja este caso como exemplo:

	class Account < ActiveRecord::Base
	  composed_of :balance, :class_name => "Money", :mapping => %w(balance amount)
	end

Nesse caso, você pode passar um objeto Money como parâmetro no método find da classe Account, assim:

	amount = 500
	currency = "USD"
	Account.find(:all, :conditions => { :balance => Money.new(amount, currency) })
	
### Last

Até agora podíamos usar apenas três operadores para procurar dados usando o método **find** do **ActiveRecord**: **:first**, **:all** e o próprio id do objeto (neste caso não usamos um operador especifico, mas a falta de um significa que estamos passando o id).

Agora teremos um quarto operador o **:last**. Veja alguns exemplos:

	Person.find(:last)
	Person.find(:last, :conditions => [ "user_name = ?", user_name])
	Person.find(:last, :order => "created_on DESC", :offset => 5)
	
Para entender como esse método foi implementado basta olhar um dos seus testes:

	def test_find_last
	  last  = Developer.find :last
	  assert_equal last, Developer.find(:first, :order => 'id desc')
	end
	
### All

O método estático **all** é um alias para o, também estático, **find(:all)**. Exemplo:
	
	Topic.all é equivalente ao Topic.find(:all)

### First

O método estático **first** é um alias para o, também estático, **find(:first)**. Exemplo:

	Topic.first é equivalente ao Topic.find(:first)

### Last

O método estático **last** é um alias para o, também estático, **find(:last)**. Exemplo:

	Topic.last é equivalente ao Topic.find(:last)