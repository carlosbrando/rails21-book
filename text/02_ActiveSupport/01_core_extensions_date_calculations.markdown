## ActiveSupport::CoreExtensions::Date::Calculations

### Time#end\_of\_day

Retorna o dia de hoje com o horário 23:59:59.

### Time#end\_of\_week

Retorna o fim da semana (domingo 23:59:59).

### Time#end\_of\_quarter

Retorna um Date representando o final do trimestre. Em outras palavras o última dia de março, junho, setembro, dezembro, o que vier primeiro.

### Time#end\_of\_year

Retorna dia 31 de dezembro às 23:59:59

### Time#in\_time\_zone

Este método é similar ao **Time#localtime**, exceto pelo fato de que usa o **Time.zone** no lugar do fuso-horário do sistema operacional. Você pode passar como parâmetro um **TimeZone** ou uma **String**. Vejamos alguns exemplos:

	Time.zone = 'Hawaii'
	Time.utc(2000).in_time_zone
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

	Time.utc(2000).in_time_zone('Alaska')
	# => Fri, 31 Dec 1999 15:00:00 AKST -09:00

### Time#days\_in\_month

Foi corrigido um bug no método **days\_in\_month** que informava o número de dias no mês de fevereiro de forma errônea quando o ano não era informado. 

A alteração consiste em usar o ano corrente quando não se informa um ano ao chamar o método. Supondo que você esteja em um ano bissexto, veja:

	Loading development environment (Rails 2.0.2)
	>> Time.days_in_month(2)
	=> 28

	Loading development environment (Rails 2.1.0)
	>> Time.days_in_month(2)
	=> 29

### DateTime#to_f

A classe **DateTime** ganhou um novo método o **to_f** que retorna a data como um ponto flutuante que representa a quantidade de segundos desde o Unix epoch (época Unix). Isto é, a quantidade de segundos desde 1 de janeiro de 1970 às zero hora.

### Date.current

A classe **Date** ganhou um método **current** que deve ser usado com substituto do **Date.today**, pois leva em conta o fuso-horário caso o **config.time\_zone** tenha sido configurado, retornando um **Time.zone.today**. Caso não tenha sido configurado ele retornará um **Date.today**.