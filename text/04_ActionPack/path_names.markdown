## Path Names

Todos já devem conhecer o meu plugin Custom Resource Name. Acho que ele pode estar com seus dias contados… :(

Já faz algum tempo que um desenvolvedor chamado Ivan Vega me procurou por email para montar um patch para o Rails baseando-se no meu plugin. Na verdade ele já tinha um código parecido e queria adaptar para funcionar mais ou menos como o meu funcionava. Trocamos algumas idéias, e ele criou o patch (com algumas alterações para ficar da forma como ele achou que seria melhor) e conseguiu com ele fosse incluído no Rails.

No Rails você já podia incluir a opção :as na suas rotas (coisa que fiz questão de implementar igual no meu plugin, para manter a compatibilidade), agora você também terá a opção :path\_names para alterar os nomes das actions.

	map.resource :schools, :as => 'escolas', :path_names => { :new => 'nova' }

Para entender como funciona o meu plugin, clique aqui.
