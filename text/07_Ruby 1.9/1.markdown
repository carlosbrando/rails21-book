## Detalhes

O principal foco das alterações do Rails foi o Ruby 1.9, mesmo os menores detalhes foram analisados para deixar o Rails o mais compatível possível com a nova versão do Ruby. Detalhes como alterar de **File.exists?** para **File.exist?** não foram deixados de fora.

Também, no Ruby 1.9, o módulo **Base64** (base64.rb) foi removido, por isto todas as referencias a ele foram substituídas por **ActiveSupport::Base64**.
