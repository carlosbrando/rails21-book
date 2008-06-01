## Usando generators em plugins

É possível configurar o **Rails** para procurar por **plugins** em outro lugar diferente do diretório **vendor/plugins**, apenas incluindo uma linha de código no arquivo **environment.rb**.

	config.plugin_paths = ['lib/plugins', 'vendor/plugins']
	
Porém na versão 2.0 do Rails, temos um bug se alterarmos esta configuração e decidirmos usar um plugin que tenha generators. Por causa desse bug o Rails só vai encontrar generators em plugins que estiverem no diretório **vendor/plugins**.

Na versão 2.1 esse bug foi corrigido.