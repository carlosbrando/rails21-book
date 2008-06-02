## Scripts

### plugin

O comando script/plugin install agora permite o uso da opção –e/--export, para que ele use um svn export. 
Foi adicionado o suporte a plugins hospedados em repositórios GIT.


### dbconsole

Esse script faz a mesma coisa que o script/console mas para o banco de dados. Em outras palavras ele entra no cliente de linha de comandos do banco de dados.

Analisando o código, aparentemente isto só vai funcionar para bancos de dados mysql, postgresql, sqlite(3). Quando um banco diferente estiver configurado no arquivo database.yml e este comando for executado, a mensagem "not supported for this database type" será exibida no terminal.
