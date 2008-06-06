## O método clone

Agora poderemos clonar um resource existente da seguinte forma:

	ryan = Person.find(1)
	not_ryan = ryan.clone
	not_ryan.new?  # => true

Só vale tomar nota que a cópia não clona nenhum atributo da classe, apenas os atributos do resource.

	ryan = Person.find(1)
	ryan.address = StreetAddress.find(1, :person_id => ryan.id)
	ryan.hash = {:not => "an ARes instance"} 

	not_ryan = ryan.clone
	not_ryan.new?            # => true
	not_ryan.address         # => NoMethodError
	not_ryan.hash            # => {:not => "an ARes instance"}