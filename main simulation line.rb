# (rows_system, number_of_cashiers, simulation_time,
#   duration_simulation_step)

  load 'users atributes.rb'
  load 'class random values.rb'

  users_info = Users_Atributes.new
  puts users_info.make_users(10)
