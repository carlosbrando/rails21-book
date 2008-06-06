## caches\_action aceita condicionais

O método **caches\_action** agora também aceita a opção **:if**, permitindo o uso de condicionais para especificar quando uma **action** pode ir para o **cache**. Por exemplo:

	caches_action :index, :if => Proc.new { |c| !c.request.format.json? }

No exemplo acima, a **action index** só irá para o **cache** se não foi acessada via um request JSON.
