require './Mechanics'

class Enemy < Mechanics

  # --------------Enemy Logic-----------------

  def enemy_decision_first_boss

    if @@enemy_hp > 2 && @@player_hp > 1

      decisions = ['heal', 'attack', 'heal', 'waste turn', 'attack', 'heal']
      range = (rand() * decisions.length)
      choice = decisions[range]

      if choice == 'attack'
        @@is_player_turn = true
        if @@player_hp <= 1 && @@bosses_defeated < 2
            @@player_hp = 0
            puts "Narrator: #{@@player_name}\'s health is now: #{@@player_hp}"
            gets
        elsif @@player_hp > 1
          @@player_hp = (@@player_hp).abs - ( ( (@@player_hp * 50) / @@player_hp_original ).floor ).abs
          puts "Narrator: #{@@enemy_name} has chosen to attack #{@@player_name}!"
          gets
          if @@player_hp <= 1 && @@bosses_defeated < 2
              @@player_hp = 0
              puts "Narrator: #{@@player_name}\'s health is now: #{@@player_hp}"
              gets
          else
            puts "Narrator: #{@@player_name}\'s health is now: #{@@player_hp}"
            gets
          end  
        end
      elsif choice == 'waste turn'
        @@is_player_turn = true
        @@enemy_hp = ( @@enemy_hp / 1.5 ).ceil
        puts "Narrator: #{@@enemy_name} has chosen to waste it\'s turn!"
        gets
        @@enemy_luck += 10
        puts "Narrator: #{@@enemy_name}\'s luck is now: #{@@enemy_luck}"
        gets
      elsif choice == 'heal'
        if @@enemy_hp < @@enemy_hp_original
            @@is_player_turn = true
            @@enemy_hp = ( (@@enemy_hp * 0.2) * (@@enemy_level) ).ceil + @@enemy_luck
            puts "Narrator: #{@@enemy_name} has chosen to heal itself!"
            gets
            puts "Narrator: #{@@enemy_name}\'s luck was: #{@@enemy_luck}"
            gets
            puts "Narrator: #{@@enemy_name}\'s health is now: #{@@enemy_hp}"
            gets
            @@enemy_luck = 0
        else
          enemy_decision_first_boss()
        end
      end
    elsif @@enemy_hp <= 2
      puts "Narrator: #{@@enemy_name} has been defeated!"
      @@bosses_defeated += 1
    end

  end

  def enemy_health_system
    @@enemy_hp = @@enemy_hp * @@enemy_level
  end

end
