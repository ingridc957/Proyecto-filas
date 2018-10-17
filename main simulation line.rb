# (rows_system, number_of_cashiers, simulation_time,
#   duration_simulation_step)
load 'structure simulation.rb'
load 'users atributes.rb'
load 'class random values.rb'


# stage = Structure_Simulation.new(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
stage = Structure_Simulation.new(1, 5, 19, 9)
stage.set_stage
puts "Debería mostrarme las filas #{stage.lines}"
puts "Debería mostrarme el número de filas #{stage.lines.length}"
puts "Debería mostrarme las cajas #{stage.cash_registers}"
puts "Debería mostrarme el número de cajas #{stage.cash_registers.length}"
puts "Debería mostrarme los usuarios"
puts stage.users
