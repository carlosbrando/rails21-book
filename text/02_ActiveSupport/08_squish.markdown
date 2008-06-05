##Removendo espaços em branco com o método squish

Dois novos métodos foram acrescentados ao objeto **String**, o **squish** e o **squish!**.

Estes métodos fazem o mesmo que o método **strip**, removendo espaços em branco do inicio e fim do texto, mas além disso também arrumam casos onde no meio do texto temos mais de um espaço deixando com apenas um.

Veja um exemplo:

	“    Um    texto    cheio    de     espaços    “.strip
	#=> “Um    texto    cheio    de     espaços”

	“    Um    texto    cheio    de     espaços    “.squish
	#=> “Um texto cheio de espaços”
