## session(:on)

Maybe you don't know anymore, but in Rails is possible to turn off sessions:

	class ApplicationController < ActionController::Base
	  session :off
	end

Note in my example, I'm turning of session for all controllers (**ApplicationController**), but I could also do for a single controller.

But if i want one controller to turn on sessions only for it ? In rails 2.1, the method accepts the **:on** option, this way:

	class UsersController < ApplicationController
	  session :on
	end
