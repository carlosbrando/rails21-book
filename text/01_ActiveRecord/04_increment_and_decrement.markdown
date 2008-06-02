## Increment e decrement

Os métodos **increment**, **increment!**, **decrement** e **decrement!** do **ActiveRecord** receberam mais um parâmetro como opcional. Nas versões anteriores do Rails você podia usar estes métodos para aumentar ou diminuir o valor de uma coluna em 1 (um). Mas a partir desta versão você poderá especificar o valor a ser adicionado ou subtraído se desejar. Assim:

	player1.increment!(:points, 5)
	player2.decrement!(:points, 2)

No exemplo acima estou somando 5 à pontuação atual do jogador 1 e subtraindo 2 da pontuação atual do jogador 2. Como este parâmetro é opcional, os seus códigos antigos não serão afetados.