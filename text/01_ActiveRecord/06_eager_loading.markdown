##Eager Loading

Para explicar esta nova funcionalidade vou precisar mostrar na prática. Vamos pegar como exemplo o código abaixo:

	Author.find(:all, :include => [:posts, :comments])
	
Estou fazendo uma pesquisa na tabela **authors**, mas incluindo na minha query as tabelas **posts** e **comments**, relacionado-as pela coluna **author_id**. Para entender melhor veja a *query* gerada pelo Rails:

	SELECT
	  authors."id"          AS t0_r0,
	  authors."created_at"  AS t0_r1,
	  authors."updated_at"  AS t0_r2,
	  posts."id"            AS t1_r0,
	  posts."author_id"     AS t1_r1,
	  posts."created_at"    AS t1_r2,
	  posts."updated_at"    AS t1_r3,
	  comments."id"         AS t2_r0,
	  comments."author_id"  AS t2_r1,
	  comments."created_at" AS t2_r2,
	  comments."updated_at" AS t2_r3
	FROM
	  authors
	  LEFT OUTER JOIN posts ON posts.author_id = authors.id
	  LEFT OUTER JOIN comments ON comments.author_id = authors.id
	
Uma única query SQL foi criada contendo **joins** entre as tabelas **authors**, **posts** e **comments**. Chamamos isto de **produto cartesiano**.

Acontece que isto nem sempre é performático, por isto foi alterado. Nesta versão do Rails ao executar a mesma pesquisa na classe **Author**, o Rails usará uma outra estratégia para recuperar os dados das três tabelas. Ao invés de usar apenas uma query com todas as tabelas relacionadas, ele usará três querys menores, uma para cada tabela. Veja o resultado no log, após executar o mesmo código acima:

	SELECT * FROM "authors"
	SELECT posts.* FROM "posts" WHERE (posts.author_id IN (1))
	SELECT comments.* FROM "comments" WHERE (comments.author_id IN (1))

Na **"maioria"** dos casos executar três querys simples é mais rápido que executar uma única query gigante.
