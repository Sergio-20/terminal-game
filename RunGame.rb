require './Mechanics'

require './Enemy'
require './Player'

class RunGame < Mechanics

  attr_accessor :player_obj, :enemy_obj

  @@player_obj = Player.new()
  @@enemy_obj = Enemy.new()

  # -------------------Battle System--------------------
    def battle_system

        until(@@is_player_turn == false && @@enemy_hp > 2)
          @@player_obj.user_abilities()
          break
        end

        until(@@is_player_turn == true && @@player_hp > 1)
          @@enemy_obj.enemy_decision_first_boss()
          break
        end

      if @@player_hp > 1 && @@enemy_hp > 2
        battle_system()
      elsif @@player_hp <= 1
        @@player_obj.user_abilities()
      elsif @@enemy_hp <= 2
        @@enemy_obj.enemy_decision_first_boss()
      end

    end

end

# Instance Variables
theGame = RunGame.new()


# Method calls
theGame.game_start
theGame.greet
theGame.first_confirmation
puts "\n"
theGame.first_boss_prologue
theGame.first_boss_battle
theGame.battle_system
theGame.first_boss_epilogue
puts "\n"
theGame.second_boss_prologue
theGame.second_boss_battle
theGame.second_boss_epilogue
puts "\n"
theGame.final_boss_prologue
theGame.final_boss_battle
theGame.final_boss_epilogue
