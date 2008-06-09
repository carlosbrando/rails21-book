## Applying title formatting in strings

There was a bug when using **String#titleize** method in a string containing 's . The bug made the method return the 's in uppercase. See an example:

	>> "brando’s blog".titleize
	=> "Brando’S Blog"
	
See the same example, but with the bug fixed:

	>> "brando’s blog".titleize
	=> "Brando’s Blog"
