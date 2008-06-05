## TimeZone

### Definindo um fuso-horário padrão

Uma nova opção foi acrescentada ao método **time\_zone\_select**, agora você pode indicar um valor padrão para os casos em que o seu usuário ainda não tenha selecionado nenhum **TimeZone**, ou quando a coluna no banco de dados for nula. Para isto foi criada a opção **:default**, então você poderá usar o método das seguintes maneiras:

	time_zone_select("user", "time_zone", nil, :include_blank => true) 
	time_zone_select("user", "time_zone", nil, :default => "Pacific Time (US & Canada)" ) 
	time_zone_select( "user", 'time_zone', TimeZone.us_zones, :default => "Pacific Time (US & Canada)")

Nos casos onde usamos a opção **:default** deve aparecer com o **TimeZone** informado já selecionado.

### O método formatted_offset

O método **formatted\_offset** foi incluído nas classes **Time** e **DateTime** para retornar no formato **+HH:MM** o desvio da hora UTC. Por exemplo, em nosso fuso-horário (hora de Brasília) o desvio retornado pelo método seria uma string com o valor **"-03:00″**.

Vamos aos exemplos:

Recuperando o desvio a partir de um DateTime:

	datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
	datetime.formatted_offset         # => "-06:00″
	datetime.formatted_offset(false)  # => "-0600″

Agora a partir de um Time:

	Time.local(2000).formatted_offset         # => "-06:00″
	Time.local(2000).formatted_offset(false)  # => "-0600″

Note que este método retorna uma **string**, que pode ser formatada ou não dependendo do valor passado como parâmetro.

### O método with\_env\_tz

O método **with\_env\_tz** permite realizar testes com fusos-horários diferentes de um uma forma bem simples:

	def test_local_offset
	  with_env_tz 'US/Eastern' do
	    assert_equal Rational(-5, 24), DateTime.local_offset
	  end
	  with_env_tz 'US/Central' do
	    assert_equal Rational(-6, 24), DateTime.local_offset
	  end
	end

Este helper era para se chamar **with\_timezone**, mas foi renomeado para **with\_env\_tz** para evitar uma confusão com o fuso-horário informado via **ENV['TZ']** e **Time.zone**.

### Time.zone_reset!

Esse método foi removido poque não estava mais sendo usado.

### Time#in\_current\_time\_zone

Esse método foi modificado para retornar **self** quando **Time.zone** for nulo. 

### Time#change\_time\_zone\_to\_current

Esse método foi modificado para retornar **self** quando **Time.zone** for nulo. 

### TimeZone#now

o método **TimeZone#now** foi alterado para retornar um **ActiveSupport::TimeWithZone** representando a hora corrente no fuso horário configurado no **Time.zone**. Exemplo:

	Time.zone = 'Hawaii'  # => "Hawaii"
	Time.zone.now         # => Wed, 23 Jan 2008 20:24:27 HST -10:00

### Compare\_with\_coercion
	
Foi criado o método **compare\_with\_coercion** (com um alias para <=>) nas classes **Time** e **DateTime**, tornando possível realizar uma comparação cronológica entre as classes **Time**, **DateTime** e instâncias do **ActiveSupport::TimeWithZone**. Para entender melhor como funciona, veja os exemplos abaixo (o resultado de cada linha está no comentário logo depois do código):

	Time.utc(2000) <=> Time.utc(1999, 12, 31, 23, 59, 59, 999) # 1
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> Time.utc(2000, 1, 1, 0, 0, 0, 001)) # -1

	Time.utc(2000) <=> DateTime.civil(1999, 12, 31, 23, 59, 59) # 1
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 0) # 0
	Time.utc(2000) <=> DateTime.civil(2000, 1, 1, 0, 0, 1)) # -1

	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new( Time.utc(1999, 12, 31, 23, 59, 59) ) # 1
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new( Time.utc(2000, 1, 1, 0, 0, 0) ) # 0
	Time.utc(2000) <=> ActiveSupport::TimeWithZone.new( Time.utc(2000, 1, 1, 0, 0, 1) )) # -1

### TimeWithZone#between?

Foi incluído o método between? na classe TimeWithZone para verificar se a instância está entre duas datas. Exemplo:

	@twz.between?(Time.utc(1999,12,31,23,59,59),
	              Time.utc(2000,1,1,0,0,1))
	
### TimeZone#parse
	
Este método cria uma nova instância de **ActiveSupport::TimeWithZone** à partir uma string. Exemplos:

	Time.zone = "Hawaii"
	# => "Hawaii"
	Time.zone.parse('1999-12-31 14:00:00')
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00


	Time.zone.now
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00
	Time.zone.parse('22:30:00')
	# => Fri, 31 Dec 1999 22:30:00 HST -10:00

### TimeZone#at

Esse método serve para criar uma nova instância de **ActiveSupport::TimeWithZone** à partir do número de segundos desde o Unix epoch. Exemplo:

	Time.zone = "Hawaii" # => "Hawaii"
	Time.utc(2000).to_f  # => 946684800.0

	Time.zone.at(946684800.0)
	# => Fri, 31 Dec 1999 14:00:00 HST -10:00

### Mais métodos 

Os métodos **to\_a**, **to\_f**, **to\_i**, **httpdate**, **rfc2822**, **to\_yaml**, **to\_datetime** e **eql?** foram adicionados na classe TimeWithZone. Para maiores informações sobre esses métodos verifique na documentação do **Rails**

### TimeWithZone se preparando para o Ruby 1.9

No Ruby 1.9 teremos alguns métodos novos na classe **Time**, métodos como:

	Time.now
	# => Thu Nov 03 18:58:25 CET 2005

	Time.now.sunday?
	# => false

Existe um para cada dia da semana.

Outra curiosidade é que o método **to\_s** do objeto **Time** também vai ter um retorno um pouco diferente. Hoje quando executamos **Time.new.to\_s**, temos o seguite:

	Time.new.to_s
	# => "Thu Oct 12 10:39:27 +0200 2006″

No Ruby 1.9 teremos:

	Time.new.to_s
	# => "2006-10-12 10:39:24 +0200″

O que isto tem há ver com Rails 2.1? Tudo, já que o Rails já está sendo preparado para lidar com estas alterações. A classe **TimeWithZone**, por exemplo, acabou de receber uma implementação para funcionar com os métodos do primeiro exemplo.
