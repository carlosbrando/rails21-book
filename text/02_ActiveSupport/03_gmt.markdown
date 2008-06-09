## UTC ou GMT?

An amendment, but interesting. Untill now Rails has been using very much the UTC acronym, but when we run the method **to\_s** of **TimeZone** object it will show GMT and not UTC. This happens because the GMT acronym is more familiar to end users.

If you take a look in Windows control panel, where you can choose timezone, you'll notice the acronym used is GMT. Google and Yahoo also have been using GMT within their products.

	TimeZone['Moscow'].to_s #=> "(GMT+03:00) Moscow"
