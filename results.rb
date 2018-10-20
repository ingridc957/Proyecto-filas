class Simulation_results
  def average_waiting_time(users_served)
    users_waiting_time = []
    users_served.each do |user|
      users_waiting_time << user[:waiting_time]
    end
    total_users_waiting_time = users_waiting_time.reduce(:+)/60.0
    total_users = users_served.length
    average_waiting_time = total_users_waiting_time/total_users
    puts "The total number of customers that passed through the cash register during the simulation period was #{total_users}. "
    puts "The average waiting time in line of users was #{average_waiting_time}"

  end
end
