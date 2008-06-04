## ActiveRecord::Base.create aceita blocos

Já estamos acostumados com o método **ActiveRecord::Base.new** que aceita o uso de blocos na criação de um novo registro. Agora podemos fazer o mesmo com o método **create**:

	# Criando um objeto, usando um bloco para informar seus atributos.
	User.create(:first_name => 'Jamie') do |u|
	  u.is_admin = false
	end

Também podemos usar o mesmo método para criar vários objetos de uma vez:

	# Criando um Array de novos objetos usando um bloco,
	# onde o bloco é executado uma vez para cada objeto:
	User.create([{:first_name => 'Jamie'}, {:first_name => 'Jeremy'}]) do |u|
	  u.is_admin = false
	end

Isto também funciona para associações:

	author.posts.create!(:title => "New on Edge") {|p| p.body = "More cool stuff!"}

	# ou

	author.posts.create!(:title => "New on Edge") do |p|
	  p.body = "More cool stuff!"
	end
