## Correção de bug no change\_column

Foi corrigido um bug existente quando se tentava usar o método **change\_column** com **:null => true** em uma coluna que foi criada usando **:null => false**. Por causa deste bug nenhuma alteração era feita.
