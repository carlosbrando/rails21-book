## Tasks

### rails:update

A partir de agora toda vez que se executar a tarefa **rake rails:freeze:edge** também será executado o **rails:update**, atualizando os arquivos de configuração e *JavaScript*.

### Banco de dados em 127.0.0.1

Foi feita uma alteração no arquivo databases.rake que antes só considerava um banco de dados local como estando em localhost para considerar também o IP **127.0.0.1**. Isto funciona tanto para a tarefa **create** como para **drop**. O arquivo databases.rake também foi refeito para tornar o código menos repetitivo.

### Congelando um release específico do Rails

Até ao Rails 2.1 não era possível congelar o Rails em seu projeto pela versão, somente pela revisão. No Rails 2.1, poderemos congelar um release específico com o comando abaixo:

	rake rails:freeze:edge RELEASE=1.2.0

## TimeZone

#### rake time:zones:all

Retorna todos os time zones que o Rails reconhece, agrupados por offset. Você também pode filtrar o retorno usando o parâmetro opcional OFFSET, por exemplo: OFFSET=-6.

#### rake time:zones:us

Exibe uma lista com todos os time zones dos USA. A opção OFFSET também vale aqui.

#### rake time:zones:local

Retorna os time zones que o Rails conhece que estão no mesmo offset do seu sistema operacional.
