## Alteração no retorno padrão do método sum do ActiveRecord

Hoje quando usamos o método sum do ActiveRecord para calcular a soma de uma determinada coluna para todos os registros de uma tabela, e nenhum registro corresponde às condições expostas na execução do método, o retorno padrão é nil.

Isto vai mudar no Rails 2.1, onde o retorno padrão (quando nenhum registro é encontrado) será 0. Veja um exemplo:

	Account.sum(:balance, :conditions => ‘1 = 2‘) #=> 0
