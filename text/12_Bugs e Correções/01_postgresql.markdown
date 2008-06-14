## Add columns in PostgreSQL

There was a bug when using **PostgreSQL**. It occurred when creating a migration for adding a column in an existing table. Look an example:

File: *db/migrate/002\_add\_cost.rb*

	class AddCost < ActiveRecord::Migration
	  def self.up
	    add_column :items, :cost, :decimal, :precision => 6, 
	   :scale => 2
	  end

	  def self.down
	    remove_column :items, :cost
	  end
	end

Note we are creating a column with **:precision => 6** and **:scale => 2**. Now run **rake db:migrate** and let's see how is our table in database:

<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td><strong>Column</strong></td>
		<td><strong>Type</strong></td>
		<td><strong>Modifiers</strong></td>
	</tr>
	<tr>
		<td>id</td>
		<td>integer</td>
		<td>not null</td>
	</tr>
	<tr>
		<td>desc</td>
		<td>character varying(255)</td>
		<td></td>
	</tr>
	<tr>
		<td>price</td>
		<td>numeric(5,2)</td>
		<td></td>
	</tr>
	<tr>
		<td>cost</td>
		<td>numeric</td>
		<td></td>
	</tr>
</table>

See "cost" column which we just created. It is a common **numeric**, but it was supposed to be a column like "price", above it, more precisely a **numeric(6,2)**. In Rails 2.1 this error doesn't occur anymore and the column will be created in the correct way.