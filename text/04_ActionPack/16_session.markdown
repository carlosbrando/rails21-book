## session(:on)

Did you know it is possible to turn off sessions in rails? Here is how to do it:

	class ApplicationController < ActionController::Base
	  session :off
	end

Note that in my example I'm turning off sessions for all controllers (**ApplicationController**), but I could also do it for a single controller.

If you want to have sessions on for a given controller in Rails 2.1 you can use the session method method passing the **:on** parameter:

	class UsersController < ApplicationController
	  session :on
	end
