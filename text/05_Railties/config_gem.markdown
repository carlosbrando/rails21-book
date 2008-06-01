## config.gem

Também falamos disto no podcast #12. No Rails 2.1 teremos outro problema que dá dor de cabeça nos desenvolvedores resolvido.

Toda vez que você entra em um projeto novo, existe uma seqüência inicial que precisa ser seguida, e os dois primeiros passos são: baixar o fonte na sua máquina e instalar todos os gems necessários. Este segundo passo é especialmente chato.

Era chato, porque agora no Rails podemos usar o novo recurso config.gem. No arquivo environment.rb você “deve” adicionar quais gems seu projeto depende, assim:

	config.gem “bj“ 

	config.gem “hpricot“, :version => ‘0.6‘,
	                      :source => “http://code.whytheluckystiff.net“ 

	config.gem “aws-s3“, :lib => “aws/s3“

Depois sua equipe, ou você mesmo, pode instalar todas as dependências de uma só vez com o comando:

	# Instala todos os gems listados
	rake gems:install

Também é possível listar quais gems estão sendo usados no projeto executando:

	# Lista todos os gems dependentes
	rake gems

E se algum dos gems tiver um arquivo rails/init.rb e você quiser levar o gem junto com sua aplicação, rode:

	# Copia o gem especifícado para vendor/gems/nome_do_gem-x.x.x
	rake gems:unpack GEM=nome_do_gem

E o gem será copiado para o diretório vendor/gems/gem\_name-x.x.x.

## config.gem em plugins

Hoje de manhã eu falei do config.gem. Agora vai uma dica para os construtores de plugins. Principalmente se o seu plugin depende de algum gem.

Até agora o arquivo init.rb de um plugin se parece com isto:

	# init.rb do plugin open_id_authentication
	require ‘yadis‘ 
	require ‘openid‘ 
	ActionController::Base.send :include, OpenIdAuthentication 

Mas no Rails 2.1 um arquivo init.rb como este deve ser criado assim:

	# Novo formato
	config.gem “ruby-openid“, :lib => “openid“, :version => “1.1.4“
	config.gem “ruby-yadis“,  :lib => “yadis“,  :version => “0.3.4“ 

	config.after_initialize do
	  ActionController::Base.send :include, OpenIdAuthentication
	end

Assim, quando você rodar a tarefa para instalar todos os gems necessários, estes gems estarão entre eles.
