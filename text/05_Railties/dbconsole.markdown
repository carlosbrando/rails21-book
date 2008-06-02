## script/dbconsole

Esta é quentinha. Acabou de sair...

No Rails 2.1 teremos mais um script para facilitar nossa vida:

	script/dbconsole

Ele faz a mesma coisa que o script/console mas para o banco de dados. Em outras palavras ele entra no cliente de linha de comandos do banco de dados. Veja o resultado do meu teste:

Como você pode ver estou usando o sqlite.

Analisando o código, aparentemente isto só vai funcionar para bancos de dados mysql, postgresql, sqlite(3). Quando um banco diferente estiver configurado no arquivo database.yml e este comando for executado, a mensagem “not supported for this database type” será exibida no terminal.

Particularmente eu gostei muito disto…
