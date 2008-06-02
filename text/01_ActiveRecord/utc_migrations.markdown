## Timestamped Migrations

Quando se está estudando Rails ou desenvolvendo algo sozinho, migrations parece ser a solução para todos os problemas. Mas quando se tem uma equipe trabalhando no mesmo projeto e todo mundo criando migrations ao mesmo tempo, você descobrirá (ou já descobriu) que migrations simplesmente não funcionam, pelo menos no formato atual do Rails.

O problema é que quando se cria uma migration, ela recebe um número. Mas o que acontece se duas pessoas criarem uma migration ao mesmo tempo, ou pior ainda, se várias pessoas começarem a criar migrations e só derem commit depois? Você terá um monte de migrations com o mesmo número com códigos diferentes. Conflito!

Hoje existe várias formas de "tentar" solucionar isto. Existem alguns plugins com abordagens diferentes para resolver este impasse. Mas independente do plugin ou abordagem que você use, uma coisa fica bem clara, a forma atual simplesmente não funciona.

Se você estiver usando Git isto é pior ainda, porque provavelmente sua equipe terá alguns branches de trabalho e podem criar migrations em todos eles, e você terá os mesmo conflitos na hora de fazer o merge.

Tanto que o coreteam alterou a criação de migrations no Rails para usar não mais um número, mas uma string baseada na hora UTC no formato: YYYYMMDDHHMMSS.

Isto ajuda a resolver um dos problemas, já que os arquivos serão criados com nomes diferentes, o que evitará conflitos. Mas ainda está longe de ser a solução definitiva.

Ainda, caso você esteja trabalhando sozinho, ou seja louco e prefira o formato atual (usando uma seqüência numérica), basta incluir esta linha no arquivo environment.rb:

	config.active_record.timestamped_migrations = false

Também foram criadas novas tarefas rake para "andar" pelos migrations:

	rake db:migrate:up
	rake db:migrate:down

## Problema com migrations resolvido

Agora à pouco eu falei sobre Timestamped Migrations, e reclamei que isto ainda não resolvia o problema com as migrations. Depois disso eu pensei que talvez a solução fosse armazenar na tabela schema_info todas as migrations executadas e cada vez que rodássemos um rake db:migrate o Rails verificasse quais scripts não foram executados, fizesse um rollback até o primeiro não executado e então rodasse tudo denovo até o fim. Na teoria isto resolveria os problemas das migrations.

Pois é, não fui só eu que pensei nisto…

Isto já está implementado para o Rails 2.1. A única diferença da minha idéia é que criaram uma outra tabela para isto, chamada schema_migrations.

Não sei, mas acho que isto resolve o problema com as migrations.
