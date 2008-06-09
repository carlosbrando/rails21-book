## change\_table
        
The creation of **migrations** in Rails 2.0 was a lot sexier than on previous verions, but to alter a table using **migrations** was not sexy at all.

In Rails 2.1, alter table became also sexy with the new method **change\_table**. Let's take a look at an example:

	change_table :videos do |t|
	  t.timestamps # this adds columns created_at and updated_at
	  t.belongs_to :goat # this adds column goat_id (integer)
	  t.string :name, :email, :limit => 20 # this adds columns name and email
	  t.remove :name, :email # this removes columns name and email
	end
              
The new method **change\_table** works just like his cousin **create\_table** but instead of creating a new table it just alters an already existing table by adding or removing columns and indexes.

	change_table :table do |t|
	  t.column # adds an ordinary column. Ex: t.column(:name, :string)
	  t.index # adds a new index.
	  t.timestamps
	  t.change # changes the column definition. Ex: t.change(:name, :string, :limit => 80)
	  t.change_default # changes the column default value.
	  t.rename # changes the name of the column.
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
