## Testando Helpers de forma simples

Uma coisa muito chata de ser fazer nas versões anteriores do Rails era testar **helpers**. Eu mesmo já sofri um bocado para garantir 100% de cobertura, criando testes para alguns **helpers**.

Isto ficou muito simples no Rails 2.1 com a nova classe **ActionView::TestCase**. Vamos pegar o código abaixo como exemplo:

	module PeopleHelper
	  def title(text)
	    content_tag(:h1, text)
	  end

	  def homepage_path
	    people_path
	  end
	end

Veja como faremos para testar isto no Rails 2.1:

	class PeopleHelperTest < ActionView::TestCase
	  def setup
	    ActionController::Routing::Routes.draw do |map|
	      map.people 'people', :controller => 'people', :action => 'index'
	      map.connect ':controller/:action/:id'
	    end
	  end

	  def test_title
	    assert_equal "<h1>Ruby on Rails</h1>", title("Ruby on Rails")
	  end

	  def test_homepage_path
	    assert_equal "/people", homepage_path
	  end
	end
