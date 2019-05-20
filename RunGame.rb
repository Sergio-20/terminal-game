require './Mechanics'

class RunGame < Mechanics

end

theGame = Mechanics.new()

theGame.game_start
theGame.greet
theGame.first_confirmation
puts "\n\n"
theGame.first_boss_prologue
theGame.first_boss_battle
theGame.first_boss_epilogue
puts "\n\n"
theGame.second_boss_prologue
theGame.second_boss_battle
theGame.second_boss_epilogue
puts "\n\n"
theGame.final_boss_prologue
theGame.final_boss_battle
theGame.final_boss_epilogue
