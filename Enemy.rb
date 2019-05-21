require './Mechanics'

class Enemy < Mechanics

  # --------------Enemy Logic-----------------

  def enemy_decision_first_boss

    if @@enemy_hp > 0 && @@player_hp > 0

      decisions = ['heal', 'attack', 'heal', 'waste turn', 'heal']
      range = (rand() * decisions.length)
      choice = decisions[range]

      if choice == 'attack'
        @@is_player_turn = true
        @@player_hp = @@player_hp - ( (@@player_hp * 50) / @@player_hp_original ).floor
        puts "#{@@enemy_name} has chosen to attack #{@@player_name}!"
        gets
        puts "#{@@player_name}\'s health is now: #{@@player_hp}"
        gets
        if @@enemy_hp <= 0
          puts "#{@@enemy_name} has been defeated!"
        end
      elsif choice == 'waste turn'
        @@is_player_turn = true
        @@enemy_hp = ( @@enemy_hp / 1.5 ).ceil
        puts "#{@@enemy_name} has chosen to waste it\'s turn!"
        gets
        @@enemy_luck += 10
        puts "#{@@enemy_name}\'s luck is now: #{@@enemy_luck}"
        gets
        if @@enemy_hp <= 0
          puts "#{@@enemy_name} has been defeated!"
        end
      elsif choice == 'heal'
        @@is_player_turn = true
        @@enemy_hp = ( (@@enemy_hp * 0.2) * (@@enemy_level) ).ceil + @@enemy_luck
        puts "#{@@enemy_name} has chosen to heal itself!"
        gets
        puts "#{@@enemy_name}\'s health is now: #{@@enemy_hp}"
        gets
        @@enemy_luck = 0
        if @@enemy_hp <= 0
          puts "#{@@enemy_name} has been defeated!"
        end
      end
    elsif @@enemy_hp <= 0
      puts "#{@@enemy_name} has been defeated!"
    end

  end

  def enemy_health_system
    @@enemy_hp = @@enemy_hp * @@enemy_level
  end

end
