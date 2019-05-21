class Mechanics

  attr_accessor(:player_name, :player_level, :player_hp, :returning_player, :is_player_turn, :enemy_name,
     :enemy_level, :enemy_hp, :gameState, :response, :counter)

  # Game Variables
  @@bosses_defeated = 0
  @@counter = 0
  @@exited_game = false;
  @@gameState = false
  @@level_counter = 0
  @@is_player_turn = true
  @@response = ""

  # Enemy Variables
  @@enemy_hp = 100
  @@enemy_level = 10
  @@enemy_name = "enemy"

  # Player Variables
  @@player_hp = 100
  @@player_level = 1
  @@player_name = ""
  @@returning_player = false

  # ---------------------Methods----------------------

  # ------------------LogIn Dialogue------------------------------

  def game_exit
    puts "exiting... Thanks for playing!"
    @@exited_game = true
  end

  def game_start
    puts "Welcome to Defeat the Dragon Online!"
    puts "Type \'e\',  \'exit\',  \'q\', or \'quit\' to stop the game."
    puts "Press the \"Enter\" key to advance the story dialogue."
    puts "Are you a returning player? (y/n)"
    @@response = gets.chomp
      if @@response.to_s == 'yes' || @@response.to_s == 'y'
        @@returning_player = true
        @@gameState = true
      elsif @@response.to_s == 'no' || @@response.to_s == 'n'
        @@returning_player = false
        @@gameState = true
      elsif @@response.to_s == "e" || @@response.to_s == "exit" || @@response.to_s == "q" || @@response.to_s == "quit"
        @@gameState = false
        game_exit()
      else
        puts "I\'m sorry I could not comprehend that. Could you reword that please?"
        puts "---"
        game_start()
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
      gets
      puts( "Your current level is: " + @@player_level.to_s + "." )
      gets

    elsif (@@returning_player == false && @@gameState == true) && @@player_name != ""
      @@returning_player = false;
      puts( "I welcome you " + @@player_name +  ", to Defeat the Dragon Online!" )
      gets
      puts( "In order to defeat the dragon you must first prove yourself by defeating two minibosses!" )
      gets
      puts( "Your current level is: " + @@player_level.to_s + "." )
      gets
    end

  end

  def first_confirmation

    puts( "Are you ready " + @@player_name + "?" )
    @@response = gets.chomp
    # *************Start of First Layer**************
    if @@response == "y" || @@response == "yes"
      puts "Ho ho!"
      gets
      puts "A mighty one, indeed!"
      gets

    elsif @@response == "n" || @@response == "no"
      # *************Start of Second Layer**************
      if @@counter == 0
        puts "Hm?"
        @@counter += 1
        gets
        first_confirmation()
      elsif @@counter == 1
        puts "Say that again. I dare ye..."
        @@counter += 1
        gets
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
            gets
            puts "TAKE THIS YA PATUNIA!"
            gets
            puts "------"
            gets
            puts "You are dead."
            gets
            puts "Cause of death: cowardliness"
            gets
            puts"\n\n"
            game_start()
            greet()
            first_confirmation()
          else
            puts "'Tis alright. Thou art just bewildered.'"
            gets
            puts "Let\'s begin!"
            gets
          end
          # *************End of Fourth Layer**************
        else
          puts "'Tis alright. Thou art just bewildered.'"
          gets
          puts "Let\'s begin!"
          gets
        end
        # *************End of Third Layer**************
      end
      # *************End of Second Layer**************
    elsif @@response == "e" ||  @@response == "exit" || @@response == "q" || @@response == "quit"
      game_exit()
    else
      puts "What are you saying lad? I can\'t understand you!"
      first_confirmation()
    end
    # *************End of First Layer**************

  end

  # -------------------Boss Dialogues--------------------

  # ----------First Boss-----------
  def first_boss_prologue
    if @@exited_game == false && @@level_counter == 0
      puts "Thou art wondering, \"Who art thou?\""
      gets
      puts "Well #{@@player_name}, I am known as: Narrator."
      gets
      puts "Narrator: I do just as I am named. I narrate."
      gets
      puts "Narrator: Listen up, you are up against a, \"Crazy Wolf\" with 300 HP."
      gets
      puts "Narrator: He has an aggresive play style and can withstand critical damage."
      gets
      puts "Narrator: #{@@player_name}, you are going to need to discover what is the best method to defeat this miniboss."
      gets
      puts "Narrator: Do so, and you will be ever closer to saving your beloved village."
      gets
      puts "Narrator: During battle you have five options:"
      gets
      puts "Narrator: Attack, Block, Heal, ???, or more options "
      gets
      puts "Narrator: During a battle, type the name of the action you wish to do into the terminal."
      gets
      puts "Narrator: Well then,"
      gets
      puts "Narrator: May you prevail..."
      gets
      puts "Narrator: Your village, your people, they are waiting!"
      gets
      puts "Narrator: Mwaha,ha,--ha!"
      gets
    end
  end

  def first_boss_battle
    if @@exited_game == false && @@level_counter == 0
      puts "BATTLE START!"
      gets
    end
  end

  def first_boss_epilogue
    if @@exited_game == false && @@level_counter == 0
      puts "First Boss code placeholder..."
    end
  end

  # ----------Second Boss-----------

  def second_boss_prologue
    if @@exited_game == false && @@level_counter == 1
      puts "Second Boss code placeholder..."
    end
  end

  def second_boss_battle
    if @@exited_game == false && @@level_counter == 1
      puts "Second Boss code placeholder..."
    end
  end

  def second_boss_epilogue
    if @@exited_game == false && @@level_counter == 2
      puts "Second Boss code placeholder..."
    end
  end

  # ----------Final Boss-----------
  def final_boss_prologue
    if @@exited_game == false && @@level_counter == 2
      puts "Final Boss code placeholder..."
    end
  end

  def final_boss_battle
    if @@exited_game == false && @@level_counter == 2
      puts "Final Boss code placeholder..."
    end
  end

  def final_boss_epilogue
    if @@exited_game == false && @@level_counter == 3
      puts "Final Boss code placeholder..."
    end
  end

end
