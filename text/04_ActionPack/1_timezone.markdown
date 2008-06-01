## TimeZone

### Definindo um fuso-horário padrão

Uma nova opção foi acrescentada ao método **time\_zone\_select**, agora você pode indicar um valor padrão para os casos em que o seu usuário ainda não tenha selecionado nenhum **TimeZone**, ou quando a coluna no banco de dados for nula. Para isto foi criada a opção **:default**, então você poderá usar o método das seguintes maneiras:

	time_zone_select("user", "time_zone", nil, :include_blank => true) 
	time_zone_select("user", "time_zone", nil, :default => "Pacific Time (US & Canada)" ) 
	time_zone_select( "user", 'time_zone', TimeZone.us_zones, :default => "Pacific Time (US & Canada)")

Nos casos onde usamos a opção **:default** deve aparecer com o **TimeZone** informado já selecionado.


### O método formatted_offset

O método **formatted\_offset** foi incluído nas classes **Time** e **DateTime** para retornar no formato **+HH:MM** o desvio da hora UTC. Por exemplo, em nosso fuso-horário (hora de Brasília) o desvio retornado pelo método seria uma string com o valor **“-03:00″**.

Vamos aos exemplos:

Recuperando o desvio a partir de um DateTime:

	datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
	datetime.formatted_offset         # => “-06:00″
	datetime.formatted_offset(false)  # => “-0600″

Agora a partir de um Time:

	Time.local(2000).formatted_offset         # => “-06:00″
	Time.local(2000).formatted_offset(false)  # => “-0600″

Note que este método retorna uma **string**, que pode ser formatada ou não dependendo do valor passado como parâmetro.

### O método with\_env\_tz

O método **with\_env\_tz** permite realizar testes com fusos-horários diferentes de um uma forma bem simples:

	def test_local_offset
	  with_env_tz ‘US/Eastern‘ do
	    assert_equal Rational(-5, 24), DateTime.local_offset
	  end
	  with_env_tz ‘US/Central‘ do
	    assert_equal Rational(-6, 24), DateTime.local_offset
	  end
	end

Este helper era para se chamar **with\_timezone**, mas foi renomeado para **with\_env\_tz** para evitar uma confusão com o fuso-horário informado via **ENV['TZ']** e **Time.zone**.

### Time.zone_reset!

Esse método foi removido poque não estava mais sendo usado.




