## Relacionamentos com readonly

Uma nova opção está presente nos relacionamentos entre modelos. Afim de impedir que seus registros possam ser alterados, podemos usar a opção **:readonly** ao associar modelos. Veja alguns exemplos:

	has_many :reports, :readonly => true

	has_one :boss, :readonly => :true

	belongs_to :project, :readonly => true

	has_and_belongs_to_many :categories, :readonly => true
	
Feito isto, os registros protegidos não poderão ser alterados. Se você tentar, terá uma excessão do tipo **ActiveRecord::ReadOnlyRecord** disparada.