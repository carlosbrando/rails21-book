## Named_scope

O gem **has\_finder** foi incorporado ao Rails, mas com um nome diferente: **named\_scope**.

Para entender o que isto acrescentou de novo ao Rails veja os exemplos abaixo:

	class Article < ActiveRecord::Base
	  named_scope :published, :conditions => {:published => true}
	  named_scope :containing_the_letter_a, :conditions => “body LIKE ‘%a%’“
	end 

	Article.published.paginate(:page => 1)
	Article.published.containing_the_letter_a.count
	Article.containing_the_letter_a.find(:first)
	Article.containing_the_letter_a.find(:all, :conditions => {…})

Ao invés de criar um método **published** para retornar os posts já publicados, estou usando o **named\_scope** para fazer isto. Mas o método é um pouco mais robusto do que isto. Veja mais alguns exemplos de como ele pode ser usado:

	named_scope :written_before, lambda { |time|
	  { :conditions => ['written_on < ?', time] }
	}

	named_scope :anonymous_extension do
	  def one
	    1
	  end
	end

	named_scope :named_extension, :extend => NamedExtension 

	named_scope :multiple_extensions, :extend => [MultipleExtensionTwo, MultipleExtensionOne]