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
    print("If you want an unique line, please enter 1, otherwise enter 0: ")
    self.validate(gets.chomp.to_i, 1)
    print("Please, enter the number of active cashiers: ")
    self.validate(gets.chomp.to_i, 2)
    print("Now, enter the time (in minutes) that you want to simulate: ")
    self.validate(gets.chomp.to_i, 3)
    print("Finally, enter the interval time(in seconds) that you want to dalay each iteration:")
    self.validate(gets.chomp.to_i, 4)
  end

  def validate(input, n)
    case n
    when 1
      while (input != 1 && input != 0)
        print("Wrong input. If you want an unique line, please enter 1, otherwise enter 0: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 2
      while (input <= 0)
        print("Wrong input. Enter the number of active cashiers: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 3
      while (input <= 0)
        print("Wrong input. Time can't be negative or zero, enter the time (in minutes) that you want to simulate: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    when 4
      while (input < 0)
        print("Wrong input. Enter the interval time(in seconds) that you want to dalay each iteration, it can't be negative: ")
        input = gets.chomp.to_i
      end
      @userInfo << input
    end
  end
end
