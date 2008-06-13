## Path Names

My blog readers (http://www.nomedojogo.com) should know about my **Custom Resource Name** plugin. I think it'll die very soon... :(

In rails you could already include the option **:as** in your routes (something I implemented in my plugin to keep compatibility). Now you will also have the **:path\_names** option to change the name of your **actions**.
	
	map.resource :schools, :as => 'escolas', :path_names => { :new => 'nova' }

Of course, my plugin will remain being useful for users of earlier Rails versions.
