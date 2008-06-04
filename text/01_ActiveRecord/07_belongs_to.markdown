## Belongs_to

O método **belongs\_to** foi modificado para permitir o uso de **:dependent => :destroy** e **:delete** em associações.

Exemplos:

	belongs_to :author_address
	belongs_to :author_address, :dependent => :destroy
	belongs_to :author_address_extra, :dependent => :delete, :class_name => "AuthorAddress"
