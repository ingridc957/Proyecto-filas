load 'structure simulation.rb'
load 'users atributes.rb'
load 'class random values.rb'
load 'class simulation step.rb'
load 'UserInput.rb'
load 'Canvas.rb'

userInfo = UserInput.new()
info = userInfo.info
rows_system = info[0]
number_of_cashiers = info[1]
simulation_time = info[2]
duration_simulation_step = info[3]
stage = Simulation_Step.new(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
stage.set_stage
stage.run_simulation
