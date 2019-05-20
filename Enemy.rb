class Enemy < Mechanics

  # --------------Enemy Logic-----------------

  def enemy_decision

    decisions = ['attack', 'block', 'heal']
    choice = rand() * decisions.length

    if choice == 'attack'
      (@@player_hp * 0.5) + (@@enemy_level * @@enemy_level)
    elsif choice == 'block'
      (@@enemy_hp * 0.3) - (@@enemy_level)
    elsif choice == 'heal'
      (@@enemy_hp * 0.2) * (@@enemy_level)
    end

  end

  def enemy_health_system
    @@enemy_hp = @@enemy_hp * @@enemy_level
  end

  def enemy_spawn
    enemy = Enemy.new()
  end

end
