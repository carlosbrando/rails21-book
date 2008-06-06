## UTC ou GMT?

Uma alteração simples, mas interessante. Até agora o Rails tem usado muito a sigla UTC, mas quando se executa o método **to\_s** do objeto **TimeZone** ele mostrará GMT e não UTC. Isto se dá porque a sigla GMT é mais familiar para o usuário final.

Se você olhar no painel de controle do Windows, onde você escolhe o fuso-horário, verá que a sigla usada é GMT. Google e Yahoo também usam GMT em seus produtos.

	TimeZone['Moscow'].to_s #=> "(GMT+03:00) Moscow"
