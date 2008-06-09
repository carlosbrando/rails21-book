## Cache

All **fragment\_cache\_key** methods now return by default the namespace 'view/' as prefix.

All caching stores were removed from **ActionController::Caching::Fragments::*** and now they can be found in **ActiveSupport::Cache::***. In this case, if you made a reference to a store, like **ActionController::Caching::Fragments::MemoryStore**, for example, you'll have to change its reference to **ActiveSupport::Cache::MemoryStore**.

**ActionController::Base.fragment\_cache\_store** is no more and **ActionController::Base.cache\_store** takes its place.

It was included in the **ActiveRecord::Base** the **cache\_key** method to facilitate the storing cache of Active Records by the new libraries **ActiveSupport::Cache::***. It works this way:

	>> Product.new.cache_key
	=> "products/new"

	>> Product.find(5).cache_key
	=> "products/5"

	>> Person.find(5).cache_key
	=> "people/5-20071224150000"

It was included the **ActiveSupport::Gzip.decompress/compress** to make easier the use of a wrapper for **Zlib**.

Now you can use among environment options the **config.cache\_store** to specify the default place of caching store. It worth mention, if the **tmp/cache** directory exists, the default is **FileStore**, in other case the **MemoryStore** will be used. You can configure in the following ways:

	config.cache_store = :memory_store
	config.cache_store = :file_store, "/path/to/cache/directory"
	config.cache_store = :drb_store, "druby://localhost:9192"
	config.cache_store = :mem_cache_store, "localhost"
	config.cache_store = MyOwnStore.new("parameter")

To make things even more easy, it was included the following comment bellow *environments/production.rb* file, in order to remember you of this option.

	# Use a different cache store in production
	# config.cache_store = :mem_cache_store
