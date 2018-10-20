# (rows_system, number_of_cashiers, simulation_time,
#   duration_simulation_step)
load 'structure simulation.rb'
load 'users atributes.rb'
load 'class random values.rb'
load 'class simulation step.rb'
load 'UserInput.rb'

# stage = Structure_Simulation.new(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
userInfo = UserInput.new()
info = userInfo.info
rows_system = info[0]
number_of_cashiers = info[1]
simulation_time = info[2]
duration_simulation_step = info[3]
stage = Simulation_Step.new(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
stage.set_stage
stage.run_simulation


# puts "Debería mostrarme las filas #{stage.lines}"
# puts "Debería mostrarme el número de filas #{stage.lines.length}"
# puts "Debería mostrarme las cajas #{stage.cash_registers}"
# puts "Debería mostrarme el número de cajas #{stage.cash_registers.length}"
# puts "Debería mostrarme los usuarios"
# puts stage.users