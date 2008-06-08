## Smallint, int or bigint in MySQL?
                       
The **MySQL** adapter for **ActiveRecord** is now smarter when creating or altering columns in the database using integer types. According to the option **:limit**, it will now tell if the column will be a **smallint**, **int** or **bigint**. Let's take a look at an example that does just that:

	case limit
	when 0..3
	  "smallint(#{limit})"
	when 4..8
	  "int(#{limit})"
	when 9..20
	  "bigint(#{limit})"
	else
	  'int(11)'
	end

Now let's map it in a **migration** file and see what column type will be created for each column:

	create_table :table_name, :force => true do |t|

	  # 0 - 3: smallint
	  t.integer :coluna1, :limit => 2 # smallint(2)

	  # 4 - 8: int
	  t.integer :coluna2, :limit => 6 # int(6)

	  # 9 - 20: bigint
	  t.integer :coluna3, :limit => 15 # bigint(15)

	  # if :limit is not informed: int(11)
	  t.integer :coluna4 # int(11)
	end
      
The **PostgreSQL** adapter had this feature already and **MySQL** just caught up.
