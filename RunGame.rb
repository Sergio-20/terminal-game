require './Mechanics'

require './Enemy'
require './Player'

class RunGame < Mechanics

  attr_accessor :player_obj, :enemy_obj

  @@player_obj = Player.new()
  @@enemy_obj = Enemy.new()

  # -------------------Battle System--------------------
    def battle_system

      until(@@is_player_turn == false)
        @@player_obj.user_abilities()
      end
      until(@@is_player_turn == true)
        @@enemy_obj.enemy_decision()
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
