require './Mechanics'

class Player < Mechanics

  # --------------Player Logic-----------------

  def user_abilities

    puts ""
    puts "#{@@player_name} it\'s your turn!"
    puts "What will you do?"
    puts ""
    puts "Attack, Waste Turn, Heal, ???, or More Options"
    choice = gets.chomp.downcase

    if @@player_hp > 0 && @@enemy_hp > 0

      if @@player_attack_streak == 4
        puts "Narrator: Laddie, if ye attack four consecutive times, the attack damage ye do shall be immense!"
        gets
      end

      if choice == 'attack'
        @@is_player_turn = false
        if @@player_attack_streak == 4
          @@enemy_hp = @@enemy_hp - ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil * 2
          @@player_attack_streak = 0
        else
          @@enemy_hp = @@enemy_hp - ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil
          @@player_attack_streak += 1
        end
        puts "#{@@player_name} has chosen to attack!"
        gets
        puts "#{@@enemy_name}\'s health is now: #{@@enemy_hp}"
        gets
        if @@player_hp <= 0
          puts "And #{@@player_name} was never heard from ever again..."
          # game_start()
        end
      elsif choice == 'waste turn'
        @@is_player_turn = false
        @@player_hp = ( @@enemy_hp / 1.5 ).floor
        puts "#{@@player_name} has chosen to waste his turn!"
        gets
        @@player_luck += 7
        puts "#{@@player_name}\'s luck is now: #{@@player_luck}"
        gets
        if @@player_hp <= 0
          puts "And #{@@player_name} was never heard from ever again..."
          # game_start()
        end
      elsif choice == 'heal'
        @@is_player_turn = false
        @@player_hp = @@player_hp + ( (@@player_hp * 0.4) * (@@player_level) ).floor + @@player_luck
        puts "#{@@player_name} has chosen heal!"
        gets
        puts "#{@@player_name}\'s health is now: #{@@player_hp}"
        gets
        @@player_luck = 0
        if @@player_hp <= 0
          puts "And #{@@player_name} was never heard from ever again..."
          # game_start()
        end
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
        puts "More Options > Show Health, Show Level, Show Attack, Show Luck"
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
          attack_power =  @@enemy_hp - ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil
          puts "#{@@player_name}\'s attack is: #{attack_power}"
          gets
          user_abilities()
          gets
        elsif choice == "show luck"
          puts "#{@@player_name}\'s luck is: #{@@player_luck}"
          gets
        else
          puts "Type your choice into the terminal!"
          user_abilities()
        end
      else
        puts "Type your choice into the terminal!"
        user_abilities()
      end

    elsif @@player_hp <= 0
      puts "And #{@@player_name} was never heard from ever again..."
      # game_start()
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
