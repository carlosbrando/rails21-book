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