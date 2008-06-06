## Condicional no método caches\_page

O método **caches\_page** ganhou uma opção para condicionar seu uso (**:if**). Veja um exemplo:

	# forma atual
	caches_page :index

	# No Rails 2.1 você pode usar a opção :if
	caches_page :index, :if => Proc.new { |c| !c.request.format.json? }
