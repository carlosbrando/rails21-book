## Date\_select

Todos os helpers que tratam datas (**date\_select**, **time\_select**, **select\_datetime**, etc.) vão aceitar HTML options, permitindo que façamos isso:

	<%= date_select ‘item‘,‘happening‘, :order => [:day], :class => ‘foobar‘%>