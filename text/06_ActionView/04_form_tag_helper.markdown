## ActionView::Helpers::FormTagHelper

### submit\_tag

A **:confirm** option was added to the parameters of **#submit\_tag** method. This option works the same way like the method **link\_to**. Look an example:

	submit_tag('Save changes', :confirm => "Are you sure?")