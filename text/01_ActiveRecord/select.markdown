## opcional :select no has\_one e belongs\_to

Os famosos has\_one e belongs\_to acabam de receber mais uma opção, o já conhecido :select.

Por padrão esta opção é o "*" do SELECT * FROM, mas você pode mudar isto e recuperar somente as colunas que serão usadas, ou sei lá… use sua imaginação.

Só um detalhe, não esqueça de colocar a primary e as foreign keys, senão você terá um lindo erro.

Outra alteração é que a opção :order do belongs\_to foi removida. Eu nem sabia que ela existia… aliás ela nem servia para nada mesmo.
