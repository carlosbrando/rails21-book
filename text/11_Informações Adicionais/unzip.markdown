## Muito atrasado com o Edge Rails… mas estamos aí

Ufa… finalmente terminei de analisar todas as alterações quer foram realizadas no Rails através do Trac. Agora estou indo para as que estão no GitHub e LightHouse, e já estou beeemm atrasado, já que tem quase 100 alterações que preciso conferir.

Talvez a alteração que precisava sair mais rápido é a do rails:freeze:edge, que precisava agora pegar um arquivo zip gerado automaticamente à partir do código no GitHub. E realmente isto saiu rápido, mas gerou uma certa polêmica, já que no meio do código havia este trecho:

unzip rails\_edge.zip

Mas, o unzip existe no Windows? Parece que até existe, mas no Windows XP Professional SP2, não é possível chamá-lo através do prompt. Como não sou mais um usuário do Windows a um bom tempo, fiz questão de esquecer estas coisas, então se alguém souber algo…

A melhor sugestão até agora é usar o gem rubyzip, e ele acabaria sendo um requisito para aqueles que querem instalar a versão edge do Rails.

Como estou muito atrasado, tenho certeza que este impasse já se resolveu, mais tarde eu volto então com a solução deste problema.
