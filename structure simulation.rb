class Structure_Simulation


	def initialize(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
		@rows_system = rows_system
		@number_of_cashiers = number_of_cashiers
		@simulation_time = simulation_time
		@duration_simulation_step = duration_simulation_step
	end

	def set_stage
		@lines = self.make_lines
		@cash_registers = self.make_cash_register
		@users = self.users_info
	end

	def make_lines
		if @rows_system == 1
			lines = []
			lines << []
		elsif @rows_system == 0
			lines = []
			for i in (1..@number_of_cashiers)
				lines << []
			end
		end
		return lines
	end

	def lines
		@lines
	end

	def make_cash_register
		cash_registers = Array.new(@number_of_cashiers, {empty:0})
		return cash_registers
	end

	def cash_registers
		@cash_registers
	end

	def users_info
		users_info = Users_Atributes.new
		@users = users_info.make_users(@simulation_time)
		return @users
	end

	def users
		@users
	end

# def testing_method
# 	puts "mostrando shift_user #{@lines[0].first.class}"
# end

end
