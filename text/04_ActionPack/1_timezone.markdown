## TimeZone

### Definindo um fuso-horário padrão

Uma nova opção foi acrescentada ao método **time\_zone\_select**, agora você pode indicar um valor padrão para os casos em que o seu usuário ainda não tenha selecionado nenhum **TimeZone**, ou quando a coluna no banco de dados for nula. Para isto foi criada a opção **:default**, então você poderá usar o método das seguintes maneiras:

	time_zone_select("user", "time_zone", nil, :include_blank => true) 
	time_zone_select("user", "time_zone", nil, :default => "Pacific Time (US & Canada)" ) 
	time_zone_select( "user", 'time_zone', TimeZone.us_zones, :default => "Pacific Time (US & Canada)")

Nos casos onde usamos a opção **:default** deve aparecer com o **TimeZone** informado já selecionado.
