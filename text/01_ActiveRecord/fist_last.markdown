## métodos first e last em named\_scope

Lembra quando eu falei dos novos métodos first, last e all que o ActiveRecord ganhou? Também se lembra quando falei do named\_scope, uma nova funcionalidade do Rails para a versão 2.1?

Pois é, este post é para avisar que agora os métodos acima também funcionarão em named\_scopes. Imagine que eu criei um named\_scope chamado recent, então eu poderei fazer isto:

	post.comments.recent.last
