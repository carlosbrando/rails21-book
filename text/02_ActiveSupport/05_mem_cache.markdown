## Mem\_cache\_store now accepts options

The inclusion of **Memcache-Client** inside **ActiveSupport::Cache** made things easier than ever, but it also took away its flexibility in not allowing us to customize nothing more than the IP of the **memcached** server.

**Jonathan Weiss** made a patch which was included in Rails allowing extra options like these:

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost"

	ActiveSupport::Cache.lookup_store :mem_cache_store, "localhost", '192.168.1.1', 
		:namespace => 'foo'

or

	config.action_controller.fragment_cache_store = :mem_cache_store, 'localhost', 
		{:compression => true, :debug => true, :namespace =>'foo'}
