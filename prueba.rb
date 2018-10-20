# # potato = Random_Values.new
# #
# # puts" numero de usuarios #{potato.users_number(25)}"
# # puts "Arriva time #{potato.arrival_times}"
# # puts "names #{potato.names}"
# # puts "service period #{potato.service_period}"
#
# class Potato
# 	def initialize(number, char)
# 		@var_initialize = number
# 		@var_initialize2 = char
# 	end
#
# 	def Variable_papa(valor)
# 		@Potato_papa = valor*5
# 		@var_initialize2 = @var_initialize2 + 'var init modf'
# 	end
#
# end
#
# class Potatito < Potato
# 	def initialize(number, char)
# 		super
# 		@other = 'variable en initialize de hijo'
# 	end
#
# 	def mostrar_variables
# 		puts "Variable definida dentro de un método del papá #{@Potato_papa}"
# 		puts "Variable definida en el initialize de papá #{@var_initialize}"
# 		puts "Variable definida en el initialize de papá y modificada en un metodo papá #{@var_initialize2}"
# 		puts "Variable definida en el initialize de hijo #{@other}"
# 	end
# end
#
#
# littlepotato = Potatito.new(8, "given_char ")
# littlepotato.Variable_papa(5)
# littlepotato.mostrar_variables
#
# # esto_es_algo_que_necesito_de_esa_clase = littlepotato.loquesea
# (rows_system, number_of_cashiers, simulation_time,
#   duration_simulation_step)
load 'structure simulation.rb'
load 'users atributes.rb'
load 'class random values.rb'
load 'class simulation step.rb'

# stage = Structure_Simulation.new(rows_system, number_of_cashiers, simulation_time, duration_simulation_step)
stage = Simulation_Step.new(0, 3, 30, 9)
stage.set_stage
# stage.testing_method
stage.run_simulation
