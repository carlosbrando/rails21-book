## Timestamped Migrations

Quando se está estudando Rails ou desenvolvendo algo sozinho, **migrations** parecem ser a solução para todos os problemas. Mas quando se tem uma equipe trabalhando no mesmo projeto e todo mundo criando **migrations** ao mesmo tempo, você descobrirá (ou já descobriu) que **migrations** simplesmente não funcionam, pelo menos nas versões anteriores do Rails.

O problema é que quando se criava uma **migration**, ela recebia um número. Mas o que acontecia se duas pessoas criassem uma **migration** ao mesmo tempo, ou pior ainda, se várias pessoas começassem a criar **migrations** e só dessem commit depois? Você tinha um monte de **migrations** com o mesmo número com códigos diferentes. Conflito!

Já existia várias formas de "tentar" solucionar isto. Havía alguns plugins com abordagens diferentes para resolver este impasse. Mas independente do plugin ou abordagem que você usesse, uma coisa fica bem clara, a forma antiga simplesmente não funcionava.

Se você estivesse usando Git isto é pior ainda, porque provavelmente sua equipe teria alguns branches de trabalho e poderiam criar **migrations** em todos eles, e você teria os mesmo conflitos na hora de fazer o merge.

Por isto, o coreteam alterou a criação de migrations no Rails para usar não mais um número, mas uma string baseada na hora **UTC** no formato: YYYYMMDDHHMMSS.

Além disso foi criada uma nova tabela chamada **schema_migrations** que armazena quais **migrations** já foram executadas. Assim, se alguém criar uma migration com um número menor, será feito um **rollback** até a versão anterior e depois executado tudo de novo até a versão corrente.

Aparentemente isto resolve o problema de conflito de **migrations**.

Se você quiser, pode desligar esta funcionalidade incluindo esta linha no arquivo environment.rb:

	config.active_record.timestamped_migrations = false

Também foram criadas novas tarefas rake para "andar" pelos **migrations**:

	rake db:migrate:up
	rake db:migrate:down
