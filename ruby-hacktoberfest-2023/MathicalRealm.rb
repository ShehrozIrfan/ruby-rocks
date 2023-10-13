class Player
    attr_accessor :player_number, :lives, :score
  
    def initialize(player_number, lives = 3)
      @player_number = player_number
      @lives = lives
      @score = 0
    end
  
    def decrease_life
      @lives -= 1
    end
  
    def correct_answer
      @score += 1
    end
  
    def lost_all_lives
      @lives == 0
    end
  
    def to_s
      "Player #{@player_number} with #{@lives} lives and #{@score} points."
    end
  end
  
  class Game
    attr_accessor :player1, :player2, :current_player, :difficulty, :question_type, :time_limit
  
    def initialize(difficulty: :easy, question_type: :addition, time_limit: 10)
      @player1 = Player.new(1)
      @player2 = Player.new(2)
      @current_player = @player1
      @difficulty = difficulty
      @question_type = question_type
      @time_limit = time_limit
    end
  
    def game_over?
      @player1.lost_all_lives || @player2.lost_all_lives
    end
  
    def switch_player
      @current_player = @current_player == @player1 ? @player2 : @player1
    end
  
    def game_loop
      until game_over?
        question = Question.new(difficulty: @difficulty, question_type: @question_type)
        puts question.to_s
  
        start_time = Time.now
  
        answer = gets.chomp.to_i
  
        end_time = Time.now
  
        time_elapsed = end_time - start_time
  
        if question.correct_answer?(answer) && time_elapsed <= @time_limit
          @current_player.correct_answer
          puts "Correct! Your score is now #{@current_player.score}."
        else
          @current_player.decrease_life
          puts "Incorrect. You have #{@current_player.lives} lives remaining."
        end
  
        switch_player
      end
  
      puts "Game over! The winner is #{@current_player} with #{@current_player.score} points."
    end
  end
  
  class Question
    attr_accessor :number1, :number2, :answer, :difficulty, :question_type
  
    def initialize(difficulty: :easy, question_type: :addition)
      @difficulty = difficulty
      @question_type = question_type
  
      case @difficulty
      when :easy
        @number1 = rand(10)
        @number2 = rand(10)
      when :medium
        @number1 = rand(100)
        @number2 = rand(100)
      when :hard
        @number1 = rand(1000)
        @number2 = rand(1000)
      end
  
      case @question_type
      when :addition
        @answer = @number1 + @number2
      when :subtraction
        @answer = @number1 - @number2
      when :multiplication
        @answer = @number1 * @number2
      when :division
        @answer = @number1 / @number2
      end
    end
  
    def to_s
      case @question_type
      when :addition
        "#{@number1} + #{@number2} = ?"
      when :subtraction
        "#{@number1} - #{@number2} = ?"
      when :multiplication
        "#{@number1} * #{@number2} = ?"
      when :division
        "#{@number1} / #{@number2} = ?"
      end
    end
  
    def correct_answer?(answer)
      answer == @answer
    end
  end
  
  # Start the game
  game = Game.new(difficulty: :medium, question_type: :multiplication, time_limit: 15)
  game.game_loop
  
