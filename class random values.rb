class Random_Values

  def users_number(simulation_time)
    users = []
    # prng = Random.new
    clients_interval = simulation_time/3 + 1
    clients_interval.times {
      # users << prng.rand(0..5)
      users << rand(0..5)
    }
    return users
  end

  def arrival_times(users_per_time_interval)
    at = []
    i = 0
    for users in users_per_time_interval do
      users.times {
        at << i + rand(0..179)
      }
      i += 180
    end
    return at
  end

  def names(users_per_time_interval)
    users_names = []
    total_users = users_per_time_interval.reduce(:+)
    letters =  Array('a'..'z')-['c']
    total_users.times {
      users_names << letters[rand(26)]
    }
    return users_names
  end

  def service_period(users_per_time_interval)
    user_service_period = []
    total_users = users_per_time_interval.reduce(:+)
    total_users.times {
      user_service_period << rand(4*60..25*60)
    }
    return user_service_period.sort!
  end
end
