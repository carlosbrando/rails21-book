## Path Names

Os leitores do meu blog (http://www.nomedojogo.com) devem conhecer o meu plugin **Custom Resource Name**. Acho que ele pode estar com seus dias contados... :(

No Rails você já podia incluir a opção **:as** na suas rotas (coisa que fiz questão de implementar igual no meu plugin, para manter a compatibilidade), agora você também terá a opção **:path\_names** para alterar os nomes das **actions**.

	map.resource :schools, :as => 'escolas', :path_names => { :new => 'nova' }

Claro que meu plugin ainda continua sendo útil para usuários de versões anteriores do Rails.
