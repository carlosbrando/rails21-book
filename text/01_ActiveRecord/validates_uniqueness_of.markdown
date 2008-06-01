## Validates uniqueness of

Post rápido apenas para documentar e alertar. No Rails 2.1 a opção :case\_sensitive do método validates\_uniqueness\_of deixará de ter seu valor default como true e passará a ser default false.

Então, fique atento quanto a isto na hora de migrar seu software.

# Atualização

Esta alteração voltou atrás. De acordo com o core team do Rails, isto não fazia sentido. Então no Rails 2.1 o valor default da opção :case\_sensitive continuará sendo true.
