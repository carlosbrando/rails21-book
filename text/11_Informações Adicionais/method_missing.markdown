## Usou o method\_missing, então não deixe pontas soltas

Devido a natureza dinâmica do Ruby, o método respond\_to? é crucial. Quantas vezes não precisamos checar se um método existe no objeto que estamos manipulando, ou mesmo verificar se o objeto é mesmo aquele que estamos esperando (is\_a?)?

Porém tem algo muito importante que muita gente se esquece. Veja por exemplo esta minha classe que faz uso do método method\_missing:

	class Cachorro
	  def method_missing(method, *args, &block)
	    if method.to_s =~ /^latir/
	      puts “auau!“
	    else
	      super
	    end
	  end
	end

	rex = Cachorro.new
	rex.latir #=> auau!
	rex.latir! #=> auau!
	rex.latir_e_correr #=> auau!

Acho que você já deve conhecer o method\_missing, não? Veja que no exemplo acima eu estou criando uma instância da classe Cachorro e chamando os métodos latir, latir! e latir\_e\_correr que não existem. Por isto o método method\_missing é disparado, onde eu uso uma expressão regular simples para retornar “auau!” caso o nome do método comece com a expressão latir.

Mas veja o que acontece quando tento usar o método respond\_to?:

	rex.respond_to? :latir #=> false
	rex.latir #=> auau!

Ele retorna false, e isto faz todo o sentido já que o método realmente não existe. Então fica na minha responsabilidade alterar o método respond\_to? para que ele funcione direito usando esta minha regra especial. Vou alterar minha classe para isto:

	class Cachorro
	  METODO_LATIR = /^latir/

	  def respond_to?(method)
	    return true if method.to_s =~ METODO_LATIR
	    super
	  end

	  def method_missing(method, *args, &block)
	    if method.to_s =~ METODO_LATIR
	      puts “auau!“
	    else
	      super
	    end
	  end
	end

	rex = Cachorro.new
	rex.respond_to?(:latir) #=> true
	rex.latir #=> auau!

Agora sim! Este é um erro comum que tenho visto em alguns códigos, inclusive no próprio Rails, tente executar um respond\_to? para verificar a existência de métodos como find\_by\_name, por exemplo.

Ruby é uma linguagem impressionante e flexível ao máximo, mas se não tomarmos cuidado podemos deixar pontas soltas como esta.
[Atualização]

Acabei de ver que no Rails 2.1 corrigiram este problema, poderemos usar o respond\_to? para verificar a existência de métodos como o find\_by\_alguma\_coisa.
