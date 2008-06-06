## Time.current

Novo método para a classe **Time**. O retorno do método **current** depende do **config.time\_zone**, se ele foi especificado antes, o método retornará um **Time.zone.now**, caso contrário será um **Time.now**.

	# o retorno depende do config.time_zone
	Time.current

Os métodos **since** e **ago** também tiveram seus retornos alterados, devolvendo um **TimeWithZone** caso o **config.time\_zone** tiver sido especificado.

Isto torna o método **Time.current** o novo método padrão para se recuperar a hora atual, substituindo o **Time.now** (que continua existindo, mas não leva em conta o fuso-horário especificado).

Os métodos **datetime\_select**, **select\_datetime** e **select\_time** também foram atualizados para terem seus valores default como **Time.current**.
