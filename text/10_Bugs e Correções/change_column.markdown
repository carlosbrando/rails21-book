## Correção de bug no change\_column

Hoje se você tentar usar o método change\_column com :null => true em uma coluna que foi criada usando :null => false, simplesmente sua coluna não vai sofrer nenhuma alteração. BUG.

No Rails 2.1 isto já estará corrigido.
