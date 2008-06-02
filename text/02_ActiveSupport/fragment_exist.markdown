## fragment\_exist? (atualizado)

Dois novos métodos adicionados ao cache\_store: fragment\_exist? e exist?.

O método fragment\_exist? faz exatamente o que promete, verifica se um cached fragment, informado através de uma chave, existe (duh!). Básicamente substituindo o famoso:

	read_fragment(path).nil?

Atualização

Preciso prestar mais atenção no nome de quem faz cada patch para o Rails, este também é de um brasileiro, o José Valim, e não é o primeiro dele que deixo passar batido. Aliás, ele fez uma pequena correção no post. Nas palavras do próprio autor:

Uma pequena correção: ao cache\_store foi adicionado apenas o exist?, enquanto o fragment\_exist? você vai poder usar no seu controller.
