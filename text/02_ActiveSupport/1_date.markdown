## Time

### Time#end\_of\_day

Este método basicamente retorna o dia de hoje com o horário 23:59:59.

### Time#end\_of\_week

Supostamente retorna o fim da semana (domingo 23:59:59). Não sei se faz muito sentido, para mim a semana termina no sábado.

### Time#end\_of\_quarter

Retorna um Date/Datime representando o final do trimestre. Em outras palavras o última dia de março, junho, setembro, dezembro, o que vier primeiro.

### Time#end\_of\_year

Retorna dia 31 de dezembro às 23:59:59


### Time#in\_time\_zone

Este método é similar ao **Time#localtime**, exceto pelo fato de que usa o **Time.zone** no lugar do fuso-horário do sistema operacional. Você pode passar como parâmetro um **TimeZone** ou uma **String**. Vejamos alguns exemplos:

	Time.zone = ‘Hawaii‘
	Time.utc(2000).in_time_zone
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00


	Time.utc(2000).in_time_zone(‘Alaska‘)
	# => Fri, 31 Dec 1999 15:00:00 AKST -09:00


## DateTime#to_f_

A classe DateTime ganhou um novo método o to_f que retorna a data como um ponto flutuante que representa a quantidade de segundos desde o Unix epoch (época Unix). Em outras palavras, se não me engano, é a quantidade de segundos desde 1 de janeiro de 1970 às zero hora.




