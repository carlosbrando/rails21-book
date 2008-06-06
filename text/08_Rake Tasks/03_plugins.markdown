## Plugins

### Gems podem ser plugins

Agora, qualquer gem que possua um arquivo **rails/init.rb** na sua árvore de diretório pode ser instalado dentro do diretório **vendor** do seu projeto Rails como se fosse um **plugin**.

### Usando generators em plugins

É possível configurar o **Rails** para procurar por **plugins** em outro lugar diferente do diretório **vendor/plugins**, apenas incluindo uma linha de código no arquivo **environment.rb**.

	config.plugin_paths = ['lib/plugins', 'vendor/plugins']
	
Porém na versão 2.0 do Rails, havia um bug com esta configuração que se manifestava quando o plugin tinha generators. Por causa desse bug o Rails só encontrava generators em plugins que estivessem no diretório **vendor/plugins**. Na versão 2.1 esse bug foi corrigido.