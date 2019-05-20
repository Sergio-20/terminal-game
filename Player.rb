class Player < Mechanics

  # --------------Player Logic-----------------

  def user_abilities

    puts "What will you do?"
    puts "Attack, Block, Heal, ???"
    choice = gets.chomp


    if choice == 'attack'
      (@@enemy_hp * 0.5) + (@@player_level * @@player_level)
    elsif choice == 'block'
      (@@player_hp * 0.3) - (@@player_level)
    elsif choice == 'heal'
      (@@player_hp * 0.2) * (@@player_level)
    elsif choice == "???"
      if @@bosses_defeated != 2 && @@player_hp != 1
        puts "You are undergoing a transformation!"
        # code to defeat final boss in one final, all-out-attack!
      else
        puts "You need to defeat two bosses, and undergo a transformation!"
      end
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
