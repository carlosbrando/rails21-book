## Opcional :select no has\_one e belongs\_to

Os famosos métodos **has\_one** e **belongs\_to** acabam de receber mais uma opção, o já conhecido **:select**.

Por padrão esta opção é o "*" do **SELECT * FROM**, mas você pode mudar isto e recuperar somente as colunas que serão usadas, ou o que sua imaginação inventar.

Só um detalhe, não esqueça de colocar a **primary** e as **foreign keys**, senão você terá um lindo erro.

Outra alteração é que a opção **:order** do **belongs\_to** foi removida. Mas não se preocupe, porque ela nem servia para nada mesmo.
