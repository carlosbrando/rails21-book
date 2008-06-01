## Hash#without

Conhece o método slice que o Rails acrescenta ao objeto Hash? O método slice é muito útil em diversas ocasiões. Veja um exemplo:

	def search(criteria = {})
	  assert_valid_keys(:mass, :velocity, :time)
	end

	search(options.slice(:mass, :velocity, :time))

Meu método search espera um Hash com as chaves :mass, :velocity e :time, se eu passar mais uma chave dentro do Hash o método assert\_valid\_keys irá retornar um ArgumentError. Para evitar este problema eu estou usando o método slice para que apenas as chaves corretas sejam passadas para o método.

É isto que o método slice faz, ele retorna um Hash apenas com as chaves informadas.

No Rails 2.1 teremos um método inverso ao slice, o método without que retorna um Hash sem as chaves informadas.

	Event.new(event.attributes.without(:id, :user_id))