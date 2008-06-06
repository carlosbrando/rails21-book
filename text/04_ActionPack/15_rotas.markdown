## Definindo a localização de seu arquivo de rotas

No Rails 2.1 você pode definir em que arquivo estão suas rotas incluindo a seguinte linha no seu arquivo *environment.rb*:

	config.routes_configuration_file

Isto pode ser útil em um cenário onde você tem dois front-ends separados que usam os mesmos módulos, bibliotecas e plugins.

Por exemplo, getsatisfaction.com e api.getsatisfaction.com compartilham os mesmos modelos, mas não os controllers, helpers e views. getsatisfaction.com tem o seu arquivo de rotas com otimizações para melhorar o seu SEO, enquanto o arquivo de rotas da API não precisaria de nada disto.
