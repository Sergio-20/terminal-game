require './Game'

class RunGame < Game

end

theGame = RunGame.new(1, 100, false)
theGame.gameStart
theGame.greet
theGame.first_confirmation
