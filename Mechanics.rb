class Mechanics

  attr_accessor(:player_name, :player_level, :player_hp, :player_hp_original, :returning_player, :is_player_turn, :enemy_name,
     :enemy_level, :enemy_hp, :enemy_hp_original, :gameState, :response, :counter)

  # Game Variables
  @@bosses_defeated = 0
  @@counter = 0
  @@exited_game = false;
  @@gameState = false
  @@level_counter = 0
  @@is_player_turn = true
  @@response = ""

  # Enemy Variables
  @@enemy_hp = 300
  @@enemy_hp_original = 300
  @@enemy_level = 10
  @@enemy_luck = 0
  @@enemy_name = "Crazy Wolf"

  # Player Variables
  @@player_attack_streak = 0
  @@player_hp = 100
  @@player_hp_original = 100
  @@player_level = 1
  @@player_luck = 0
  @@player_name = ""
  @@returning_player = false

  # ---------------------Methods----------------------

  # ------------------LogIn Dialogue------------------------------

  def game_exit
    puts "exiting... Thanks for playing!"
    @@exited_game = true
  end

  def game_start
    puts "Welcome to Defeat the Dragon!"
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
        puts "I\'m sorry that could not be comprehended. Could you reword that please?"
        puts "---"
        game_start()
      end
  end

  def greet

    greetings = ['hello', 'greetings', 'welcome back hero', 'good day', 'welcome back', 'glad your back', 'Ready to take arms?', 'Time to fight!', 'Let\'s head out!']
    randomGreeting = rand() * greetings.length

    puts "Mysterious Voice 1: Welcome to Defeat the Dragon!"
    gets
    puts "Mysterious Voice 1: What is thy name?"

    @@player_name = gets.chomp

    if @@player_name == "" || @@player_name == nil
      name_check_nil()
    else

      if @@returning_player == true && @@gameState == true
        puts( greetings[randomGreeting].to_s.capitalize + " " + @@player_name + "!" )
        gets
        puts( "Narrator: Yer current level is: " + @@player_level.to_s + "." )
        gets

      elsif (@@returning_player == false && @@gameState == true) && @@player_name != ""
        @@returning_player = false;
        puts( "Mysterious Voice 1: I welcome you " + @@player_name +  ", to Defeat the Dragon!" )
        gets
        puts( "Mysterious Voice 1: In order to defeat the dragon you must first prove yourself by defeating two minibosses!" )
        gets
        puts( "Mysterious Voice 1: Your current level is: " + @@player_level.to_s + "." )
        gets

      end
    end
  end

  def first_confirmation

    puts( "Mysterious Voice 1: Are you ready to save your village " + @@player_name + "?" )
    @@response = gets.chomp
    # *************Start of First Layer**************
    if @@response == "y" || @@response == "yes"
      puts "Mysterious Voice 1: Ho ho!"
      gets
      puts "Mysterious Voice 1: A mighty one, indeed!"
      gets

    elsif @@response == "n" || @@response == "no"
      # *************Start of Second Layer**************
      if @@counter == 0
        puts "Mysterious Voice 1: Hm?"
        @@counter += 1
        gets
        first_confirmation()
      elsif @@counter == 1
        puts "Mysterious Voice 1: Say that again. I dare ye..."
        @@counter += 1
        gets
        first_confirmation()
      elsif @@counter == 2
        puts "Mysterious Voice 1: Are you sure?"
        @@response = gets.chomp
        # *************Start of Third Layer**************
        if @@response == "y" || @@response == "yes"
          puts "Mysterious Voice 1: Are you sure that you\'re sure?"
          @@response = gets.chomp
          # *************Start of Fourth Layer**************
          if @@response == "y" || @@response == "yes"
            puts "Mysterious Voice 1: YOU COWARD!!!"
            gets
            puts "Mysterious Voice 1: TAKE THIS YA COWARD!"
            gets
            puts "------"
            gets
            puts "Mysterious Voice 1: You are dead."
            gets
            puts "Mysterious Voice 1: Cause of death: cowardliness"
            gets
            puts"\n\n"
            game_start()
            greet()
            first_confirmation()
          else
            puts "Mysterious Voice 1: 'Tis alright. Thou art just bewildered.'"
            gets
            puts "Mysterious Voice 1: Let\'s begin!"
            gets
          end
          # *************End of Fourth Layer**************
        else
          puts "Mysterious Voice 1: 'Tis alright. Thou art just bewildered.'"
          gets
          puts "Mysterious Voice 1: Let\'s begin!"
          gets
        end
        # *************End of Third Layer**************
      end
      # *************End of Second Layer**************
    elsif @@response == "e" ||  @@response == "exit" || @@response == "q" || @@response == "quit"
      game_exit()
    else
      puts "Mysterious Voice 1: What are ye saying lad? I can\'t understand ye!"
      gets
      first_confirmation()
    end
    # *************End of First Layer**************

  end

  def name_check_nil
    while @@player_name == "" || @@player_name == nil
      puts "Mysterious Voice 1: Please type something at least."
      gets
      puts "Mysterious Voice 1: What is thy name?"
      @@player_name = gets.chomp
    end
  end

  # -------------------Boss Dialogues--------------------

  # ----------First Boss-----------
  def first_boss_prologue
    if @@exited_game == false && @@level_counter == 0
      puts "Mysterious Voice 1: Thou art wondering, \"Who art thou?\""
      gets
      puts "Mysterious Voice 1: Well #{@@player_name}, I am known as: Narrator."
      gets
      puts "Narrator: I do just as I am named. I narrate."
      gets
      puts "Narrator: What a surprise, eh?"
      gets
      puts "Narrator: ....."
      gets
      puts "#{@@player_name}: ....."
      gets
      puts "Narrator: ....."
      gets
      puts "#{@@player_name}: ....."
      gets
      puts "Narrator: No laugh, laddie? Not even a smile?"
      gets
      puts "#{@@player_name}: ....."
      gets
      puts "Narrator: I see, well then,"
      gets
      puts "Narrator: Listen lad, ye are up against a, \"Crazy Wolf\" with 300 HP."
      gets
      puts "Narrator: He has a withdrawn play style, and seeks to engulf yer village."
      gets
      puts "Narrator: About Gameplay..."
      gets
      puts "Narrator: During battle ye have five options:"
      gets
      puts "Narrator: Attack, Waste Turn, Heal, ???, or More Options "
      gets
      puts "Narrator: During a battle, type the name of the action ye wish to do into the terminal."
      gets
      puts "Narrator: Select \"Attack\" to lower yer enemy\'s HP!"
      gets
      puts "Narrator: Choose \"Waste Turn\" in order to increase yer luck."
      gets
      puts "Narrator: It is quite useful, laddie. It will increase the amount of health ye receive upon using the \"Heal\" command!"
      gets
      puts "Narrator: Choosing \"Heal\" will increase yer HP."
      gets
      puts "Narrator: As for \"???\", I do not know what that is for.....nor how to use it.....maybe ye can figure it out, laddie?"
      gets
      puts "Narrator: Finally, \"More Options\" shows ye information about some of yer stats."
      gets
      puts "Narrator: Well then,"
      gets
      puts "Narrator: A bit of a warning before the hero departs..."
      gets
      puts "Narrator: That, \"Crazy Wolf\" has a nasty habit of healing itself."
      gets
      puts "Narrator: Ye will need to figure out a way to counter that habit."
      gets
      puts "Narrator: #{@@player_name}, ye are going to need to overcome this miniboss."
      gets
      puts "Narrator: Do so, and ye will be ever closer to saving yer beloved village."
      gets
      puts "Narrator: Now,..."
      gets
      puts "Narrator: May ye prevail..."
      gets
      puts "Narrator: Yer village, yer people, they are waiting!"
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
    if (@@bosses_defeated == 1)
      puts "First Boss code placeholder Epilogue..."
    end
  end

  # ----------Second Boss-----------

  def second_boss_prologue
    if @@exited_game == false && @@level_counter == 1
      puts "Second Boss code placeholder Prologue..."
    end
  end

  def second_boss_battle
    if @@exited_game == false && @@level_counter == 1
      puts "Second Boss code placeholder Battle..."
    end
  end

  def second_boss_epilogue
    if @@exited_game == false && @@level_counter == 2
      puts "Second Boss code placeholder Epilogue..."
    end
  end

  # ----------Final Boss-----------
  def final_boss_prologue
    if @@exited_game == false && @@level_counter == 2
      puts "Final Boss code placeholder Prologue..."
    end
  end

  def final_boss_battle
    if @@exited_game == false && @@level_counter == 2
      puts "Final Boss code placeholder Battle..."
    end
  end

  def final_boss_epilogue
    if @@exited_game == false && @@level_counter == 3
      puts "Final Boss code placeholder Epilogue..."
    end
  end

end
