## config.gem

Agora é possível configurar todas as gems necessárias para o funcionamento correto de um projeto através do novo recurso **config.gem**. No arquivo **environment.rb** você pode adicionar quais gems seu projeto depende, como nesse exxemplo:

	config.gem "bj" 

	config.gem "hpricot", :version => '0.6',
	                      :source => "http://code.whytheluckystiff.net" 

	config.gem "aws-s3", :lib => "aws/s3"

Pode instalar todas as dependências de uma só vez basta usar o comando:

	# Instala todos os gems listados
	rake gems:install

Também é possível listar quais gems estão sendo usados no projeto executando:

	# Lista todos os gems dependentes
	rake gems

E se algum dos gems tiver um arquivo **rails/init.rb** e você quiser levar o gem junto com sua aplicação, rode:

	# Copia o gem especifícado para vendor/gems/nome_do_gem-x.x.x
	rake gems:unpack GEM=nome_do_gem

E o gem será copiado para o diretório **vendor/gems/gem\_name-x.x.x**. Caso você não especifique o nome do gem o Rails irá copiar todos os gems para o diretório **vendor/gem**

## config.gem em plugins

O recurso do **config.gem** também está disponível para uso com plugins.

Até a versão 2.0 o arquivo **init.rb** de um plugin se parecia com isto:

	# init.rb do plugin open_id_authentication
	require 'yadis' 
	require 'openid' 
	ActionController::Base.send :include, OpenIdAuthentication 

Mas no Rails 2.1 o arquivo **init.rb** seria:

	config.gem "ruby-openid", :lib => "openid", :version => "1.1.4"
	config.gem "ruby-yadis",  :lib => "yadis",  :version => "0.3.4" 

	config.after_initialize do
	  ActionController::Base.send :include, OpenIdAuthentication
	end

Assim, quando você rodar a tarefa para instalar todos os gems necessários, estes gems estarão entre eles.
