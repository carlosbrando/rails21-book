## ActiveRecord#Sum

### Expressões no método sum

Agora podemos usar expressões em método de cálculo do **ActiveRecord**, como o método sum, por exemplo.

	Person.sum(“2 * age“)

### Alteração no retorno padrão do método sum

Nas versões anteriores, quando usamos o método sum do ActiveRecord para calcular a soma de uma determinada coluna para todos os registros de uma tabela, e nenhum registro corresponde às condições expostas na execução do método, o retorno padrão é nil.

No Rails 2.1 o retorno padrão (quando nenhum registro é encontrado) é 0. Veja um exemplo:

	Account.sum(:balance, :conditions => ‘1 = 2‘) #=> 0
