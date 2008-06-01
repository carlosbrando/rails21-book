## Find

A partir de agora é possível passar um objeto como parâmetro no método **find** de uma classe **ActiveRecord**. Veja este caso como exemplo:

	class Account < ActiveRecord::Base
	  composed_of :balance, :class_name => “Money”, :mapping => %w(balance amount)
	end

Nesse caso, você pode passar um objeto Money como parâmetro no método find da classe Account, assim:

	amount = 500
	currency = “USD”
	Account.find(:all, :conditions => { :balance => Money.new(amount, currency) })