#Necesito:
# Filas y su contenido
# numero de cajas
# Estado de cajas
class Canvas
  def initialize()

  end

  def show(filas, cajas)
    @lines = filas
    @cash_registers = cajas
    if @lines.length == 1
      self.unique
    else
      self.multiple
    end
  end

  def unique
    print "----->\n"
    for i in (1..@cash_registers.length)
      print "\t|C|"
    end
    print "\n"
    @cash_registers.each do |client|
      print "\t#{client[:name]}"
    end
    print "\n\n"
    @lines[0].each do |client|
      print "\t\t|#{client[:name]}|\n"
    end
    print "\n"
  end

  def multiple
    print "----->\n"
    for i in (1..@cash_registers.length)
      print "\t|C|"
    end
    print "\n"
    @cash_registers.each do |client|
      print "\t#{client[:name]}"
    end
    print "\n\n"
    lengths = []
		@lines.each do |element|
			lengths <<  element.length
		end
		max = lengths.max
    for i in (0..max-1)
      @lines.each do |fila|
        if i < fila.length
          print "\t|#{fila[i][:name]}|"
        end
      end
      print "\n"
    end
    print "\n"
  end
end
