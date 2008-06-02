## Date.current

Lembra quando eu falei do Time.current? Pois é, a classe Date também ganhou um método current.

Apenas relembrando, este método deve servir como substituto do Date.today, pois ele leva em conta o fuso-horário caso o config.time\_zone tenha sido configurado, retornando um Time.zone.today. Caso não tenha sido configurado ele retornará um Date.today.

O ActionView date\_helper também foi alterado para usar o Date.current para determinar o seu valor padrão.
