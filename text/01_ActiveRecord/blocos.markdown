## Usando blocos para criar associações

Aproveitando que estamos relembrando algumas das novidades já mencionadas aqui no blog, vamos relembrar que agora podemos usar blocos para criar objetos do ActiveRecord.

O Ryan Bates dos famosos Railscasts acrescentou esta mesma funcionalidade também às associações de um AR. Assim, podemos também fazer isto:

	author.posts.create!(:title => "New on Edge") {|p| p.body = "More cool stuff!"}

	# ou

	author.posts.create!(:title => "New on Edge") do |p|
	  p.body = "More cool stuff!"
	end
