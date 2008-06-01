## Time

### Time#end\_of\_day

Este método basicamente retorna o dia de hoje com o horário 23:59:59.

### Time#end_of_week

Supostamente retorna o fim da semana (domingo 23:59:59). Não sei se faz muito sentido, para mim a semana termina no sábado.

### Time#end_of_quarter

Retorna um Date/Datime representando o final do trimestre. Em outras palavras o última dia de março, junho, setembro, dezembro, o que vier primeiro.

### Time#end_of_year

Retorna dia 31 de dezembro às 23:59:59

## DateTime#to_f_

A classe DateTime ganhou um novo método o to_f que retorna a data como um ponto flutuante que representa a quantidade de segundos desde o Unix epoch (época Unix). Em outras palavras, se não me engano, é a quantidade de segundos desde 1 de janeiro de 1970 às zero hora.