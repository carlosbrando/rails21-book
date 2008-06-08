## Calculations 
                         
**ActiveRecord::Calculations**' has changed a bit to also support table names. This comes in handy when we have relationships among different tables with the same column name. You have these two options now:

	authors.categories.maximum(:id)
	authors.categories.maximum("categories.id")
