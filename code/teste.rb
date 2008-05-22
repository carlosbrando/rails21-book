module Life 
  def answer(teste)
    # teste de número
    @nome.teste { :caracas => 45 }
    @@nome.teste = true
  end

  # BEGIN special
  def teste
    x = a > 5 ? "caramba" : lambda do |teste|
      "aiaiai"
    end
  end
  # END special
end