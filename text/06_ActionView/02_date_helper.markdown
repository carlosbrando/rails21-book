## ActionView::Helpers::DateHelper

Now, all these module methods dealing with dates  (**date\_select**, **time\_select**, **select\_datetime**, etc.) are accepting **HTML** options. Look an example using **date\_select**

	<%= date_select 'item','happening', :order => [:day], :class => 'foobar'%>
	
### date\_helper

The **date\_helper** method was updated to use **Date.current** in order to define its default value.