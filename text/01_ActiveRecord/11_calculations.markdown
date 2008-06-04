## Calculations 

O **ActiveRecord::Calculations** mudou um pouquinho para aceitar além do nome da coluna, também o nome da tabela. Isto é útil quando temos relacionamentos entre tabelas que contém uma ou mais colunas com o mesmo nome. Os métodos afetados são métodos como **sum** ou **maximum** do **ActiveRecord**. Resumindo, você pode fazer destas duas formas:

	authors.categories.maximum(:id)
	authors.categories.maximum("categories.id")
