class NumberPuzzleMaster
  attr_reader :secret_number, :best_score, :timer

  def initialize
    @secret_number = Random.rand(100) + 1
    @best_score = nil
    @timer = nil
  end

  def set_difficulty(min, max)
    @secret_number = Random.rand(min..max)
  end

  def start_timer(seconds)
    @timer = Timer.new(seconds)
    @timer.start
  end

  def play
    puts "Welcome to the Number Puzzle Master!"

    # Get the player's desired difficulty level
    puts "Choose a difficulty level:"
    puts "1. Easy (1-10)"
    puts "2. Medium (1-50)"
    puts "3. Hard (1-100)"

    difficulty = gets.chomp.to_i
    case difficulty
    when 1
      set_difficulty(1, 10)
    when 2
      set_difficulty(1, 50)
    when 3
      set_difficulty(1, 100)
    else
      puts "Invalid difficulty level."
      exit
    end

    # Start the timer
    start_timer(10)

    # Start the game loop
    loop do
      # Check if the timer has expired
      if @timer && @timer.expired?
        puts "Time's up!"
        break
      end

      # Get the player's guess
      puts "Guess a number from 1 to #{@secret_number}:"
      guess = gets.chomp.to_i

      # Check if the player guessed correctly
      if guess == @secret_number
        puts "Congratulations! You guessed correctly!"
        break
      else
        puts "Incorrect guess."
      end
    end

    # Display the player's score
    score = @timer ? @timer.remaining_time : 0
    puts "Your score is: #{score}"

    # Update the player's best score
    if @best_score.nil? || score > @best_score
      @best_score = score
    end

    # Display the player's best score
    puts "Your best score is: #{@best_score}"
  end
end

class Timer
  attr_reader :start_time, :end_time

  def initialize(seconds)
    @start_time = Time.now
    @end_time = Time.now + seconds
  end

  def start
    @start_time = Time.now
  end

  def expired?
    Time.now >= @end_time
  end

  def remaining_time
    @end_time - Time.now
  end
end

# Create a new game
game = NumberPuzzleMaster.new

# Start the game
game.play
