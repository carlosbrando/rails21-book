## Os métodos add\_timestamps remove\_timestamps


Agora temos dois novos métodos: **add\_timestamps** e **remove\_timestamps**, que cria e remove (respectivamente) as colunas de **timestamps**. Veja um exemplo:

	def self.up
	  add_timestamps :feeds
	  add_timestamps :urls
	end

	def self.down
	  remove_timestamps :urls
	  remove_timestamps :feeds
	end

**_E temos migrations um pouco mais sexy… Uhh Baby…_**