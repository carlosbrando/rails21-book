## Congelando um release específico do Rails

Hoje no Rails não é possível congelar o Rails em seu projeto pela versão, mas somente podemos fazer isto pela revisão. Claro que podemos verificar qual foi a última revisão antes do lançamento da versão, mas isto é trabalho extra.

No Rails 2.1, poderemos congelar um release específico com o comando abaixo:

	rake rails:freeze:edge RELEASE=1.2.0
