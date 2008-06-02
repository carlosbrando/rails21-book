## label\_tag agora aceita :for

Lembra do método label\_tag?

Agora ele aceita a opção :for, veja um exemplo:

	label(:post, :title, nil, :for => "my_for")

Isto vai retornar algo assim:

	<label for="my_for">Title</label>

Hmm… não entendi para que isto…
