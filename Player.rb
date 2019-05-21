require './Mechanics'

class Player < Mechanics

  # --------------Player Logic-----------------

  def user_abilities

    puts ""
    puts "#{@@player_name} it\'s your turn!"
    puts "What will you do?"
    puts ""
    puts "Attack, Block, Heal, ???, or more options"
    choice = gets.chomp.downcase


    if choice == 'attack'
      @@is_player_turn = false
      @@enemy_hp = (@@enemy_hp * 0.5) + (@@player_level * @@player_level)
      puts "#{@@player_name} has chosen to attack!"
      gets
      puts "#{@@enemy_name}\'s health is now: #{@@enemy_hp}"
      gets
    elsif choice == 'block'
      @@is_player_turn = false
      @@player_hp = (@@player_hp * 0.3) - (@@player_level)
      puts "#{@@player_name} has chosen to block oncoming attacks!"
      gets
      puts "#{@@player_name}\'s health is now: #{@@player_hp}"
    elsif choice == 'heal'
      @@is_player_turn = false
      @@player_hp = (@@player_hp * 0.2) * (@@player_level)
      puts "#{@@player_name} has chosen heal!"
      gets
      puts "#{@@player_name}\'s health is now: #{@@player_hp}"
      gets
    elsif choice == "???"
      if @@bosses_defeated == 2 && @@player_hp == 1
        puts "You are undergoing a transformation!"
        gets
        puts "#{@@player_name} has chosen to attack!"
        gets
        puts "It\'s an all-out-attack!"
        @@enemy_hp = 0
        gets
        puts "The Final Boss has his health depleted to zero!"
      else
        puts "You need to defeat two bosses, and undergo a transformation!"
        user_abilities()
      end
    elsif choice == "more options"
      @@is_player_turn = true
      puts "More Options > Show Health, Show Level, Show Attack"
      choice = gets.chomp.downcase
      if choice == "show health"
        puts "#{@@player_name}\'s health is: #{@@player_hp}"
        gets
        user_abilities()
        gets
      elsif choice == "show level"
        puts "#{@@player_name}\'s level is: #{@@player_level}"
        gets
        user_abilities()
        gets
      elsif choice == "show attack"
        attack_lvl = (@@enemy_hp * 0.5) + (@@player_level * @@player_level)
        puts "#{@@player_name}\'s attack is: (@@enemy_hp * 0.5) + #{attack_lvl}"
        gets
        user_abilities()
        gets
      else
        puts "Type your choice into the terminal!"
        user_abilities()
      end
    else
      puts "Type your choice into the terminal!"
      user_abilities()
    end

  end

  def user_health_system
    @@player_hp = @@player_hp * @@player_level * @@player_level
  end

  def level_up
    if @@bosses_defeated >= 1
      @@player_level += 1
      puts "Woah I leveled up!"
      puts "-------"
      puts "You are now level: " + @@player_level + "!"
    end
  end

end
