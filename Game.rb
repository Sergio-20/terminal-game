class Game

  attr_accessor :player, :level, :hp, :newPlayer, :gameState, :response, :gameplayDecision, :counter

  @@counter = 0
  @@gameState = false
  @@response = ""
  @@player = ""

  $gameplayDecision = ""

  def initialize(level, hp, newPlayer)
    @level = level
    @hp = hp
    @newPlayer = newPlayer
  end

  def gameStart
    puts "Welcome to Defeat the Dragon Online!"
    puts "Are you a returning player? (y/n)"
    puts " Type \'e\',  \'exit\',  \'q\', or \'quit\' to stop the game."
    @@response = gets.chomp
      if @@response.to_s == 'yes' || @@response.to_s == 'y'
        @newPlayer = true
        @@gameState = true
      elsif @@response.to_s == 'no' || @@response.to_s == 'n'
        @newPlayer = false
        @@gameState = true
      elsif @@response.to_s == "e" || @@response.to_s == "exit" || @@response.to_s == "q" || @@response.to_s == "quit"
        @@gameState = false
        puts "exiting... Thanks for playing!"
      else
        puts "I\'m sorry I could not comprehend that. Could you reword that please?"
        puts "---"
        gameStart()
      end
  end

  def greet

    greetings = ['hello', 'greetings', 'welcome back hero', 'good day', 'welcome back', 'glad your back']
    randomGreeting = rand() * greetings.length

    puts "Welcome to Defeat the Dragon Online!"
    puts "What is thy name?"

    @@player = gets.chomp

    if @newPlayer == true && @@gameState == true
      puts( greetings[randomGreeting].to_s.capitalize + " " + @@player + "!" )
      puts( "Your current level is: " + @level.to_s + "." )

    elsif (@newPlayer == false && @@gameState == true) && @@player != ""
      @newPlayer = false;
      puts( "I welcome you " + @@player +  ", to Defeat the Dragon Online!" )
      puts( "In order to defeat the dragon you must first prove yourself by defeating three minibosses!" )
      puts( "Your current level is: " + @level.to_s + "." )
    end

  end

  def first_confirmation

    puts( "Are you ready " + @@player + "?" )
    @@response = gets.chomp
    # *************Start of First Layer**************
    if @@response == "y" || @@response == "yes"
      puts "Ho ho!"
      puts "A mighty one, indeed!"

    elsif @@response == "n" || @@response == "no"
      # *************Start of Second Layer**************
      if @@counter == 0
        puts "Hm?"
        @@counter += 1
        first_confirmation()
      elsif @@counter == 1
        puts "Say that again. I dare ye..."
        @@counter += 1
        first_confirmation()
      elsif @@counter == 2
        puts "Are you sure?"
        @@response = gets.chomp
        # *************Start of Third Layer**************
        if @@response == "y" || @@response == "yes"
          puts "Are you sure that you\'re sure?"
          @@response = gets.chomp
          # *************Start of Fourth Layer**************
          if @@response == "y" || @@response == "yes"
            puts "YOU COWARD!!!"
            puts "TAKE THIS YA PATUNIA!"
            puts "------"
            puts "You are dead."
            puts "Cause of death: cowardliness"
            gameStart()
          else
            puts "'Tis alright. Thou art just bewildered.'"
            puts "Let\'s begin!"
          end
          # *************End of Fourth Layer**************
        else
          puts "'Tis alright. Thou art just bewildered.'"
          puts "Let\'s begin!"
        end
        # *************End of Third Layer**************
      end
      # *************End of Second Layer**************
    else
      puts "What are you saying lad? I can\'t understand you!"
      first_confirmation()
    end
    # *************End of First Layer**************

  end

end
