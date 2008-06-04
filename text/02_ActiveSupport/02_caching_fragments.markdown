## Fragment\_exist?

Dois novos métodos foram adicionados ao **cache\_store**: **fragment\_exist?** e **exist?**.

O método **fragment\_exist?** faz exatamente o que promete, verifica se um cached fragment, informado através de uma chave existe. Básicamente substituindo o famoso:

	read_fragment(path).nil?

O método **exist?** foi adicionado ao **cache\_store**, enquanto que o **fragment\_exist?** é um helper para que você vai poder usar no seu controller.
