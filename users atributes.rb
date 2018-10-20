class Users_Atributes
	def initialize
		@users_information = []
	end

	def make_users(simulation_time)
		users = Random_Values.new
		users_per_time_interval = users.users_number(simulation_time)
		at =  users.arrival_times
		users_names = users.names
		user_service_period = users.service_period
		for user_position in Array(0.. at.length-1) do
			@users_information << {name: users_names[user_position],
				arrival_time: at[user_position],
				service_period: user_service_period[user_position]}
			end
			return @users_information
		end
	end
