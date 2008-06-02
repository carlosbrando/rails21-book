## ActionView::Helpers::DateHelper

Agora todos os métodos desse módulo que tratam datas (**date\_select**, **time\_select**, **select\_datetime**, etc.) aceitam HTML options. Veja um exemplo usando o **date\_select**

	<%= date_select 'item','happening', :order => [:day], :class => 'foobar'%>
	
### date\_helper

O método date\_helper foi alterado para usar o **Date.current** para determinar o seu valor padrão.