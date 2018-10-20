class UserInput

  def initialize()
    puts("Welcome to the rows proyect.")
    @userInfo = []
    self.read()
  end

  def info()
    @userInfo
  end

protected
  def read()
    print("Para única fila ingrese 1, para múltiples filas ingrese 2: ")
    self.validate(gets.chomp.to_i, 1)
    print("Ingrese el número de cajas activas: ")
    self.validate(gets.chomp.to_i, 2)
    print("Ingrese el tiempo de la simulación en minutos: ")
    self.validate(gets.chomp.to_i, 3)
    print("Ingrese el delta de tiempo para cada iteración: ")
    self.validate(gets.chomp.to_i, 4)
  end

  def validate(input, n)
    case n
    when 1
      while (input != 1 && input != 2)
        print("Respuesta incorrecta. Para unica fila ingrese 1, para multiples filas ingrese 2: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 2
      while (input <= 0)
        print("Respuesta incorrecta. Ingrese el número de cajas activas: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 3
      while (input <= 0)
        print("Respuesta incorrecta. Ingrese un tiempo mayor a 0 (Tiempo de simulación): ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 4
      while (input <= 0)
        print("Respuesta incorrecta. Ingrese un tiempo mayor a 0 (Delay entre cada iteración): ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    end
  end
end
