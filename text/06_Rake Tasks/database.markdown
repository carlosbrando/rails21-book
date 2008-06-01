## Banco de dados em 127.0.0.1

Foi feita uma alteração no arquivo databases.rake que antes só considerava um banco de dados local como estando em localhost para considerar também o IP **127.0.0.1**. Isto funciona tanto para a tarefa **create** como para **drop**. O arquivo databases.rake também foi refeito para tornar o código menos repetitivo.
