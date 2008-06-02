## Rails.version

Até agora se você desejasse descobrir durante a execução do seu código qual é a versão do Rails que está no ar, bastava usar:

	Rails::VERSION::STRING

Mas temos de concordar que isto não parece muito legal. Por isto no Rails 2.1 não usaremos mais este código, mas sim:

	Rails.version

Melhor!
