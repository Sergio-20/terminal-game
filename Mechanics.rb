class Mechanics

  attr_accessor :player_name, :player_level, :player_hp, :returning_player, :enemy_name, :enemy_level, :enemy_hp, :gameState, :response, :counter

  # Game Variables
  @@bosses_defeated = 0
  @@counter = 0
  @@gameState = false
  @@response = ""

  # Enemy Variables
  @@enemy_hp = 0
  @@enemy_level = 0
  @@enemy_name = ""

  # Player Variables
  @@player_hp = 100
  @@player_level = 1
  @@player_name = ""
  @@returning_player = false

  # ---------------------Methods----------------------

  # ------------------Log In Dialogue------------------------------

  def gameStart
    puts "Welcome to Defeat the Dragon Online!"
    puts "Are you a returning player? (y/n)"
    puts " Type \'e\',  \'exit\',  \'q\', or \'quit\' to stop the game."
    @@response = gets.chomp
      if @@response.to_s == 'yes' || @@response.to_s == 'y'
        @@returning_player = true
        @@gameState = true
      elsif @@response.to_s == 'no' || @@response.to_s == 'n'
        @@returning_player = false
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

    greetings = ['hello', 'greetings', 'welcome back hero', 'good day', 'welcome back', 'glad your back', 'Ready to take arms?', 'Time to fight!', 'Let\'s head out!']
    randomGreeting = rand() * greetings.length

    puts "Welcome to Defeat the Dragon Online!"
    puts "What is thy name?"

    @@player_name = gets.chomp

    if @@returning_player == true && @@gameState == true
      puts( greetings[randomGreeting].to_s.capitalize + " " + @@player_name + "!" )
      puts( "Your current level is: " + @@player_level.to_s + "." )

    elsif (@@returning_player == false && @@gameState == true) && @@player_name != ""
      @@returning_player = false;
      puts( "I welcome you " + @@player_name +  ", to Defeat the Dragon Online!" )
      puts( "In order to defeat the dragon you must first prove yourself by defeating two minibosses!" )
      puts( "Your current level is: " + @@player_level.to_s + "." )
    end

  end

  def first_confirmation

    puts( "Are you ready " + @@player_name + "?" )
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
            puts"\n\n"
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


  # -------------------Boss Dialogues--------------------

  def first_boss

  end

  def second_boss

  end

  def final_boss

  end

end
