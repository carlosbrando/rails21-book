## Has\_one

O método **has\_one** recebeu suporte a opção **through**. Ele funciona exatamente como o has_many :through, mas para apenas um relacionamento. Exemplo:

	class Magazine < ActiveRecord::Base
	  has_many :subscriptions
	end

	class Subscription < ActiveRecord::Base
	  belongs_to :magazine
	  belongs_to :user
	end

	class User < ActiveRecord::Base
	  has_many :subscriptions
	  has_one :magazine, :through => : subscriptions, :conditions => ['subscriptions.active = ?', true]
	end
	
## Has\_one com :source\_type

O método **has\_one :through** suporta o **:source\_type**. Vou tentar explicar isto através de exemplos. Vamos começar com estas duas classes:

	class Client < ActiveRecord::Base
	  has_many :contact_cards 

	  has_many :contacts, :through => :contact_cards
	end 

O que nos interessa aqui é que tenho uma classe **Client** que possui (**has_many**) muitos contatos, que pode ser de qualquer tipo, já que a classe **ContactCard** possui um relacionamento polimórfico.

Para seguir com nosso exemplo, vamos criar duas classes que representarão um **ContactCard**:

	class Person < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end

	class Business < ActiveRecord::Base
	  has_many :contact_cards, :as => :contact
	end

**Person** e **Business** estão relacionados com a minha classe **Client**, através da tabela **ContactCard**, ou seja eu tenho dois tipos de contatos, os pessoais e os de negócios. O problema é que isto não vai funcionar, veja o que acontece quando tento recuperar algum contato:

	>> Client.find(:first).contacts
	# ArgumentError: /…/active_support/core_ext/hash/keys.rb:48:
	# in `assert_valid_keys’: Unknown key(s): polymorphic 

Para fazer isto funcionar teremos de usar a opção **:source_type**. Vamos alterar nossa classe **Client**:

	class Client < ActiveRecord::Base
	  has_many :people_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :person 

	  has_many :business_contacts,
	           :through => :contact_cards,
	           :source => :contacts,
	           :source_type => :business
	end
	
Note que agora temos duas formas diferentes de recuperar nossos contatos, onde eu deixo claro qual tipo (**:source_type**) de contato estou esperando.

	Client.find(:first).people_contacts
	Client.find(:first).business_contacts