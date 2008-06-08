## Readonly relationships

A new feature is added to the relationship among models. To avoid change in a models' state you can now use **:readonly** when describing associations. Let's take a look at a few examples:

	has_many :reports, :readonly => true

	has_one :boss, :readonly => :true

	belongs_to :project, :readonly => true

	has_and_belongs_to_many :categories, :readonly => true
	      
This way your associated models are safe from being edited from within this model. If you try editing any of them you will get an **ActiveRecord::ReadOnlyRecord** exception.