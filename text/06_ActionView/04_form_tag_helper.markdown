## ActionView::Helpers::FormTagHelper

### submit\_tag

It was added the **:confirm** option in the parameters of **#submit\_tag** method. This option works the same way like the method **link\_to**. Look an example:

	submit_tag('Save changes', :confirm => "Are you sure?")