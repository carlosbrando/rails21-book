## JSON

Rails agora aceita POSTs de conteúdo JSON. Por exemplo, você pode enviar uma requisição POST assim:

	POST /posts
	{"post": {"title": "Breaking News"}}

E o tudo vai para dentro da variável params. Isto aqui funcionará, por exemplo:

	def create
	  @post = Post.create params[:post]
	  # …
	end

Para quem não sabe o JSON é um "concorrente" do XML, e é muito usado para tráfego de dados em JavaScript, porque é representado nesta linguagem. Daí o seu nome: JavaScript Object Notation.
