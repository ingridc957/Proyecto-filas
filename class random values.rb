class Random_Values

	def initialize
		@frequency_of_users = []
		@arrival_time = []
		@users_names = []
		@user_service_period = []
	end
	def users_number(simulation_time)
		clients_interval = simulation_time/3 + 1
		clients_interval.times {
			@frequency_of_users << rand(0..5)
		}
		return @frequency_of_users
	end

	def arrival_times
		i = 0
		for users in @frequency_of_users do
			users.times {
				@arrival_time << i + rand(0..179)
			}
			i += 180
		end
		@arrival_time = @arrival_time.sort!
		return @arrival_time.sort!
	end

	def names
		total_users = @frequency_of_users.reduce(:+)
		letters =  Array('a'..'z')-['c']
		total_users.times {
			@users_names << letters[rand(25)]+letters[rand(25)]
		}
		return @users_names
	end

	def service_period
		total_users = @frequency_of_users.reduce(:+)
		total_users.times {
			@user_service_period << rand(4*60..25*60)
		}
		return @user_service_period
	end
end
