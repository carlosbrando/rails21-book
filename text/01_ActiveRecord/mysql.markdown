## smallint, int ou bigint no MySQL?

O adaptador de MySQL do ActiveRecord ficou um pouco mais esperto na hora de criar ou alterar colunas no banco de dados usando inteiros. De acordo com a opção :limit, ele define se a coluna será um smallint, int ou bigint. Veja um trecho do código que faz isto:

	case limit
	when 0..3
	  “smallint(#{limit})“
	when 4..8
	  “int(#{limit})“
	when 9..20
	  “bigint(#{limit})“
	else
	  ‘int(11)‘
	end

O trecho acima foi extraído do arquivo activerecord/lib/active\_record/connection\_adapters/mysql\_adapter.rb à partir da linha 470.

Para ficar mais claro, vamos mapear isto em um migration e ver que tipo de coluna será criado para cada caso:

	create_table :table_name, :force => true do |t|

	  # de 0 à 3: smallint
	  t.integer :coluna1, :limit => 2 # smallint(2)

	  # de 4 à 8: int
	  t.integer :coluna2, :limit => 6 # int(6)

	  # de 9 à 20: bigint
	  t.integer :coluna3, :limit => 15 # bigint(15)

	  # se a opção :limit não for informada: int(11)
	  t.integer :coluna4 # int(11)
	end

O adaptador do PostgreSQL já fazia assim, o do MySQL apenas seguiu a tendência.
