## UTC ou GMT?

An amendment, but interesting. Until now Rails has been using the UTC acronym a lot, but when the method **to\_s** from **TimeZone** is called, it will print GMT, not UTC. This is due to the fact that the GMT acronym is the most common among end users.

If you take a look in Windows control panel, where you can choose timezone, you'll notice the acronym used is GMT. Google and Yahoo also have been using GMT within their products.

	TimeZone['Moscow'].to_s #=> "(GMT+03:00) Moscow"
