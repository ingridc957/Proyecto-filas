class Simulation_Step < Structure_Simulation

	def initialize(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
		super
		@users_served = []
		@minute = 1
	end

	def shortest_row
		lengths = []
		@lines.each do |element|
			lengths <<  element.length
		end
		minimum = lengths.min
		index = lengths.find_index(minimum)
		return index
	end

	def stand_in_line

		while @users.first[:arrival_time] < @minute*60
			index = self.shortest_row
			new_line = @lines[index]
			new_line.push(@users.first)
			@lines[index].replace(new_line)
			@users.replace(@users.drop(1))
			break if @users.length == 0
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
		canvas = Canvas.new()
		canvas.show(@lines, @cash_registers)
		init_time = Time.now.strftime("%S")
		while @minute <= @simulation_time
			self.stand_in_line if @users.length > 0
			self.empty_cashier
			if @rows_system == 1
				self.fill_cashier_one_line
			else
				self.fill_cashier_multiple_lines
			end
			delay = 0
			while delay < @duration_simulation_step
				time = Time.now.strftime("%S")
				time = time.to_i
				if time < init_time.to_i
					time = time + 60
				end
				delay = time - init_time.to_i
			end
			canvas.show(@lines, @cash_registers)
			init_time = time
			@minute += 1
		end
		self.avgtime
	end

	def avgtime
		times = 0
		@users_served.each do |user|
			times = times + user[:waiting_time]
		end
		puts "Promedio de espera: #{(times/@users_served.length)/60} minutos."
	end

	def users_served
		@users_served
	end

end
