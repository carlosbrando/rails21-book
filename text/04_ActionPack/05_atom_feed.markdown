## New namespaces in Atom Feed

Do you know the **atom\_feed** method? It is one of the new features of Rails 2.0, making easier the creation of Atom feeds. See an example of use:

In a *index.atom.builder* file:

	atom_feed do |feed|
	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end

What is an Atom feed ? Atom is the name of XML based style and meta data. In other words is a protocol to publish content in Internet that is often updated, like a blog, for example. Feeds are always published in XML and in Atom it is identified as an application/atom+xml media type.

In the first versions of Rails 2.0 this method used to accept as parameter **:language**, **:root_url** and **:url** options, you can obtain more information about these methods in Rails Documentation. But with the update mede, now we can include new namespaces in the root element of the feed. For example:

	atom_feed('xmlns:app' => 'http://www.w3.org/2007/app') do |feed|

It will return:

	<feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom" 
		xmlns:app="http://www.w3.org/2007/app">

Modifying the example used before, we could use this way:

	atom_feed({'xmlns:app' => 'http://www.w3.org/2007/app',
		'xmlns:openSearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed| 

	  feed.title("Nome do Jogo")
	  feed.updated((@posts.first.created_at))
	  feed.tag!(openSearch:totalResults, 10) 

	  for post in @posts
	    feed.entry(post) do |entry|
	      entry.title(post.title)
	      entry.content(post.body, :type => 'html')
	      entry.tag!('app:edited', Time.now) 

	      entry.author do |author|
	        author.name("Carlos Brando")
	      end
	    end
	  end
	end
