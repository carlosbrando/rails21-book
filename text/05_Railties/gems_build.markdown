## gems:build e gems:unpack

Eu já falei por aqui das novas funcionalidade do config.gem, entre elas mencionei a tarefa:

	rake gems:unpack GEM=nome_do_gem

O comando acima copia o gem especificado para dentro do Rails. Isto é uma mão na roda para quem usa shared host.

Agora a novidade é o comando:

	rake gems:unpack

Neste caso não estou especificando qual gem quero copiar, então ele copia todos os gems da qual minha aplicação depende. Para entender como configurar isto, clique aqui.

Além disso, também foi criado as seguintes tarefas:

	rake gems:build # Para todas as gems
	rake gems:build GEM=mygem # Estou informando a gem

Que compilam as extensões nativas do gems que foram instalados através do gems:unpack.