## change\_table

Criar **migrations** ficou muito mais sexy depois do lançamento do Rails 2.0, mas alterar uma tabela usando **migrations** continuou sendo da forma antiga, nada sexy.

No Rails 2.1, alterar uma tabela também é sexy, com o novo método **change\_table**. Veja um exemplo:

	change_table :videos do |t|
	  t.timestamps # adiciona as colunas created_at e updated_at
	  t.belongs_to :goat # adiciona a coluna goat_id (integer)
	  t.string :name, :email, :limit => 20 # adiciona duas colunas: name e email
	  t.remove :name, :email # remove as colunhas name e email
	end

Funciona como o **create\_table**, mas ao invés de criar uma nova tabela, apenas altera uma tabela existente, adicionando ou removendo colunas e índices. Veja uma lista das opções existentes:

	change_table :table do |t|
	  t.column # cria uma coluna simples. Ex: t.column(:name, :string)
	  t.index # Adiciona um novo índice à tabela
	  t.timestamps
	  t.change # muda a definição da coluna. Ex: t.change(:name, :string, :limit => 80)
	  t.change_default # muda o valor padrão da coluna.
	  t.rename # muda o nome da coluna
	  t.references
	  t.belongs_to
	  t.string
	  t.text
	  t.integer
	  t.float
	  t.decimal
	  t.datetime
	  t.timestamp
	  t.time
	  t.date
	  t.binary
	  t.boolean
	  t.remove
	  t.remove_references
	  t.remove_belongs_to
	  t.remove_index
	  t.remove_timestamps
	end
