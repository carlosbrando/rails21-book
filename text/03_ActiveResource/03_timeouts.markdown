## Timeouts

O Active Resource usa HTTP para acessar APIs RESTful e por isto está suscetível a problemas de lentidão ou servidores fora do ar. Em alguns casos, suas chamadas ao ActiveResource podem expirar (timeout). Agora você pode controlar o tempo de expiração com a propriedade timeout.

	class Person < ActiveResource::Base
	  self.site = "http://api.people.com:3000/"
	  self.timeout = 5 # espera 5 segundos antes de expirar
	end

Neste exemplo foi configurado o tempo de timeout para 5 segundos. É recomendado que este valor seja baixo, para permitir que seu sistema falhe rápido (ou fail-fast), impedindo falhas em cascata que poderiam incapacitar o seu servidor.

Internamente o Active Resource se baseia na biblioteca Net::HTTP para fazer requests HTTP. Quando você define um valor para a propriedade timeout, o mesmo valor é definido para o read\_timeout da instância do objeto Net::HTTP que está sendo usado.

O valor padrão é de 60 segundos.
