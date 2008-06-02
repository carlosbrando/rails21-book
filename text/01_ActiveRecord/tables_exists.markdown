## table_exists?

Novo método para a classe AbstractAdapter: table\_exists?. Seu uso é muito simples:

	>> ActiveRecord::Base.connection.table_exists?(“users“)
	=> true
