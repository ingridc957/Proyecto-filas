require './UserInput.rb'

class Simulation

  def initialize()
    userInfo = UserInput.new()
    @info = userInfo.info
    print @info
    self.build()
  end

protected
  def build()
    i = 1
    amigo = 'friend'
    while i <= @info[1]
      puts "Hola #{amigo}."
      caja{i} = Caja.new()
      i += 1
    end
  end
end
