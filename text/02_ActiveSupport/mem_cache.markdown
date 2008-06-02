## mem\_cache\_store agora aceita opções

A inclusão do Memcache-Client no ActiveSupport::Cache facilitou muito as coisas, mas também removeu a flexibilidade, não deixando personalizar mais nada além do IP do servidor do memcached.

Jonathan Weiss criou um patch, que foi incluído no Rails, incluindo opções extras, como estas:

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost"

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost", '192.168.1.1', :namespace => 'foo'

ou

	config.action_controller.fragment_cache_store = :mem_cache_store, 'localhost', {:compression => true, :debug => true, :namespace =>'foo'}