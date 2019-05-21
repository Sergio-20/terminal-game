require './Mechanics'

class Player < Mechanics

  # --------------Player Logic-----------------

  def user_abilities

    if @@player_hp > 1 && @@enemy_hp > 2

      puts ""
      puts "Narrator: #{@@player_name}, it\'s your turn!"
      puts "Narrator: What will ye do?"
      puts ""
      puts "Narrator: Attack, Waste Turn, Heal, ???, or More Options"
      choice = gets.chomp.downcase

      if @@player_attack_streak == 4
        puts "Narrator: Laddie, if ye attack four consecutive times, the attack damage ye do shall be immense!"
        gets
      end

      if choice == 'attack'
        @@is_player_turn = false
        if @@player_attack_streak == 4
          @@enemy_hp = (@@enemy_hp).abs - ( ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil * 2 ).abs
          @@player_attack_streak = 0 
        else
          @@enemy_hp = @@enemy_hp - ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil
          @@player_attack_streak += 1
        end
        puts "Narrator: #{@@player_name} has chosen to attack!"
        gets
        puts "Narrator: #{@@enemy_name}\'s health is now: #{@@enemy_hp}"
        gets
      elsif choice == 'waste turn'
        @@is_player_turn = false
        @@player_attack_streak = 0
        puts "Narrator: #{@@player_name} has chosen to waste the turn!"
        gets
        @@player_luck += 7
        puts "Narrator: #{@@player_name}\'s luck is now: #{@@player_luck}"
        gets
      elsif choice == 'heal'
        if @@player_hp < @@player_hp_original
          @@is_player_turn = false
          @@player_attack_streak = 0
          @@player_hp = @@player_hp + ( (@@player_hp * 0.4) * (@@player_level) ).floor + @@player_luck
          puts "Narrator: #{@@player_name} has chosen heal!"
          gets
          puts "Narrator: #{@@player_name}\'s health is now: #{@@player_hp}"
          gets
          @@player_luck = 0
        else
          puts "Your health is already max!"
          gets
          user_abilities()
        end
      elsif choice == "???"
        if @@bosses_defeated == 2 && @@player_hp == 1
          puts "Mysterious Voice 2: You are undergoing a transformation!"
          gets
          puts "Narrator: #{@@player_name} has chosen to attack!"
          gets
          puts "Narrator: It\'s an all-out-attack!"
          @@enemy_hp = 0
          gets
          puts "Narrator: The Final Boss has his health depleted to zero!"
        else
          puts "Mysterious Voice 2: You need to defeat two bosses, and undergo a transformation!"
          user_abilities()
        end
      elsif choice == "more options"
        @@is_player_turn = true
        puts "Narrator: More Options > Show Health, Show Level, Show Attack, Show Luck"
        choice = gets.chomp.downcase
        if choice == "show health"
          puts "Narrator: #{@@player_name}\'s health is: #{@@player_hp}"
          gets
          user_abilities()
          gets
        elsif choice == "show level"
          puts "Narrator: #{@@player_name}\'s level is: #{@@player_level}"
          gets
          user_abilities()
          gets
        elsif choice == "show attack"
          attack_power =  @@enemy_hp - ( (@@enemy_hp * 100) / @@enemy_hp_original ).ceil
          puts "Narrator: #{@@player_name}\'s attack is: #{attack_power}"
          gets
          user_abilities()
          gets
        elsif choice == "show luck"
          puts "Narrator: #{@@player_name}\'s luck is: #{@@player_luck}"
          gets
        else
          puts "Narrator: Type yer choice into the terminal!"
          user_abilities()
        end
      else
        puts "Narrator: Type yer choice into the terminal!"
        user_abilities()
      end

    elsif @@player_hp <= 1
      puts "-----"
      gets
      puts "Mysterious Voice 2: The finitude within #{@@player_name}\ has run out."
      puts "-----"
      gets
      puts "Narrator: And #{@@player_name} was never heard from ever again..."
      gets
      puts "-----"
      gets
      puts "-----"
      gets
      game_start()
      gets
    end

  end

  def user_health_system
    @@player_hp = @@player_hp * @@player_level * @@player_level
  end

  def level_up
    if @@bosses_defeated >= 1
      @@player_level += 1
      puts "#{@@player_name}: Woah I leveled up!"
      puts "-------"
      puts "Narrator: You are now level: " + @@player_level + "!"
    end
  end

end
