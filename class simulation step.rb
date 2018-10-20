class Simulation_Step < Structure_Simulation

	def initialize(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
		super
		@users_served = []
		@minute = 1
	end
	# def finalized_purchase(minute)
	#
	#   for cashier in  Array(1..@number_of_cashiers) do
	#
	#     if @cash_registers[cashier].nil? next
	#     else
	#       @cash_registers[cashier][:end_purchase]
	#     end
	#   end
	# end

	def shortest_row
		lengths = []
		@lines.each do |element|
			lengths <<  element.length
		end
		minimum = lengths.min
		index = lengths.find_index(minimum)
		puts "La fila que dio más corta es #{index}"
		puts "gente en fila #{lengths}"
		return index
	end

	def stand_in_line
		while @users.first[:arrival_time] < @minute*60
			index = self.shortest_row
			puts "imprimiendo index #{index}"
			puts "lines antes de meter usuario #{@lines}"
			puts "aqui lo va a meter #{@lines[index]} "
			new_line = []
			new_line.push(@users.first)
			@lines[index].replace(new_line)
			 @lines[index].push(@users.first)
			puts "lines DESPUES de meter usuario CON INDEX #{@lines}"
			@users.replace(@users.drop(1))
		end
	end

	def empty_cashier
		cash_update = []
		@cash_registers.each do |client|
			if client[:end_of_purchase].nil?
				cash_update <<  client
			elsif client[:end_of_purchase] < @minute*60
				cash_update << {empty: client[:end_of_purchase] }
			else
				cash_update << client
			end
		end
		@cash_registers = cash_update
	end

	def fill_cashier_one_line
		cash_update = []
		@cash_registers.each do |client|
			if client[:empty].nil? || @lines.first.empty?
				cash_update << client
			else
				shift_user = @lines.first.first
				service_time = shift_user[:service_period]
				arrival_time = shift_user[:arrival_time]
				begin_atemption = [client[:empty], arrival_time].max
				new_atribute = {begin_atemption: begin_atemption, end_of_purchase: begin_atemption + service_time, waiting_time: begin_atemption-arrival_time} #usar merge ver como está esto de [[]] en la linea :(
				complete_client = shift_user.merge(new_atribute)
				cash_update << complete_client
				@users_served << complete_client
				@lines.first.replace(@lines.first.drop(1))
			end
		end
		@cash_registers = cash_update
	end

	def fill_cashier_multiple_lines
		cash_update = []
		@cash_registers.each_with_index { |client, line|
			shift_user = @lines[line].first
			if client[:empty].nil? || @lines[line].empty?
				cash_update <<  client
			else
				service_time = shift_user[:service_period]
				arrival_time = shift_user[:arrival_time]
				begin_atemption = [client[:empty], arrival_time].max
				new_atribute = {begin_atemption: begin_atemption, end_of_purchase: begin_atemption + service_time, line: line, waiting_time: begin_atemption-arrival_time} #usar merge ver como está esto de [[]] en la linea :(
				complete_client = shift_user.merge(new_atribute)
				cash_update << complete_client
				@users_served << complete_client
				@lines[line].replace(@lines[line].drop(1))
			end
		}
		@cash_registers = cash_update
	end

	def run_simulation
		#self.mostrando
		while @minute <= @simulation_time
			self.stand_in_line if @users.length > 0
			self.empty_cashier
			if @rows_system == 1
				self.fill_cashier_one_line
			else
				self.fill_cashier_multiple_lines
			end
			#self.mostrando
			@minute += 1
		end
	end

	def mostrando
		puts "000000000000000000000000000000000000000000000000000000000000"
		puts "Este es el minuto en el que vamos #{@minute*60}"
		# puts "Filas #{ @lines}"
		puts "Filas"
		puts @lines
		puts "Número de filas "
		puts @lines.length
		puts "Estado de las cajas"
		puts @cash_registers
		puts "Número de cajas"
		puts @cash_registers.length
		puts "Usuarios por llegar"
		puts @users
		puts "Usuarios atendidos1"
		puts @users_served
		puts "===================================================================="
	end

def users_served
	@users_served
end

end
