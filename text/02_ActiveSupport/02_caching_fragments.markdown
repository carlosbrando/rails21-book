## Fragment\_exist?

Two new methods were added to **cache\_store**: **fragment\_exist?** and **exist?**.

The method **fragment\_exist?** does exactly what you would expect it to. It verifies if a cached fragment informed by one key exists.  Basically replacing the famous:

	read_fragment(path).nil?

**exist?** method was added to **cache\_store**, while **fragment\_exist?** is a helper which you could use inside your controller.
