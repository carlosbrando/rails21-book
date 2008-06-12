## Using email as username.

Some services use the e-mail as username, which forces us to use an URL like the following:

	http://ernesto.jimenez@negonation.com:pass@tractis.com

But this was causing a problem. Because we have two (@), the interpreter got lost when reading this. For this reason, **ActiveResource** was extended a little bit more, envisioning to make easier to use e-emails for authentication. Now you can do the following:

	class Person < ActiveResource::Base
	  self.site = "http://tractis.com"
	  self.user = "ernesto.jimenez@negonation.com"
	  self.password = "pass"
	end
