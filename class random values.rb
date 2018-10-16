class Random_Values

	def initialize
		@frequency_of_users = []
		@arrival_time = []
		@users_names = []
		@user_service_period = []
	end
	def users_number(simulation_time)
		# users_per_time_interval = []
		# prng = Random.new
		clients_interval = simulation_time/3 + 1
		clients_interval.times {
			# users << prng.rand(0..5)
			@frequency_of_users << rand(0..5)
		}
		return @frequency_of_users
	end

	# def arrival_times(@frequency_of_users)
	def arrival_times
		# at = []
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
			@users_names << letters[rand(26)]
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

# potato = Random_Values.new
#
# puts" numero de usuarios #{potato.users_number(25)}"
# puts "Arriva time #{potato.arrival_times}"
# puts "names #{potato.names}"
# puts "service period #{potato.service_period}"
