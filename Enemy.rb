require './Mechanics'

class Enemy < Mechanics

  # --------------Enemy Logic-----------------

  def enemy_decision

    if @@enemy_hp > 0

      decisions = ['attack', 'block', 'heal']
      range = (rand() * decisions.length) + 1
      choice = decisions[range]

      if choice == 'attack'
        @@is_player_turn = true
        @@player_hp = (@@player_hp * 0.5) + (@@enemy_level * @@enemy_level)
        puts "#{@@enemy_name} has chosen to attack #{@@player_name}!"
        gets
        puts "#{@@player_name}\'s health is now: #{@@player_hp}"
        gets
      elsif choice == 'block'
        @@is_player_turn = true
        @@enemy_hp = (@@enemy_hp * 0.3) - (@@enemy_level)
        puts "#{@@enemy_name} has chosen to block #{@@player_name} \'s attacks!"
        gets
        puts "#{@@enemy_name}\'s health is now: #{@@enemy_hp}"
        gets
      elsif choice == 'heal'
        @@is_player_turn = true
        @@enemy_hp = (@@enemy_hp * 0.2) * (@@enemy_level)
        puts "#{@@enemy_name} has chosen to heal itself!"
        gets
        puts "#{@@enemy_name}\'s health is now: #{@@enemy_hp}"
        gets
      end
    else
      puts "#{@@enemy_name} has been defeated!"
    end

  end

  def enemy_health_system
    @@enemy_hp = @@enemy_hp * @@enemy_level
  end

end
