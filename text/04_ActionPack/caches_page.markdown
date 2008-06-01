## Condicional no método caches\_page

No Rails 2.1 o método caches\_page aceitará uma opção para condicionar seu uso (:if). Veja um exemplo:

	# forma atual
	caches_page :index

	# No Rails 2.1 você poderá usar a opção :if
	caches_page :index, :if => Proc.new { |c| !c.request.format.json? }