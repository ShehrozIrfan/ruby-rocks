class CodeBreaker
  attr_accessor :code, :puzzle_type

  def initialize(puzzle_type)
    @puzzle_type = puzzle_type
    @code = generate_code
  end

  def generate_code
    Array.new(4) { rand(0..9) }
  end

  def check_guess(guess)
    feedback = Feedback.new

    case @puzzle_type
    when :addition
      feedback.correct_digits = guess.sum == @code.sum
    when :subtraction
      feedback.correct_digits = guess.first - guess.last == @code.first - @code.last
    when :multiplication
      feedback.correct_digits = guess.inject(:*) == @code.inject(:*)
    when :division
      feedback.correct_digits = guess.first / guess.last == @code.first / @code.last
    when :prime_number
      feedback.correct_digits = guess.all? { |digit| digit.prime? } && @code.all? { |digit| digit.prime? }
    when :fibonacci
      feedback.correct_digits = guess.last == @code.last + @code.last - 1
    else
      raise "Invalid puzzle type"
    end

    feedback.correct_positions = guess.each_with_index.count { |digit, index| digit == @code[index] }

    feedback
  end

  def game_over?
    feedback = check_guess(@code)

    feedback.correct_digits == 4 && feedback.correct_positions == 4
  end
end

class Feedback
  attr_accessor :correct_digits, :correct_positions

  def initialize
    @correct_digits = 0
    @correct_positions = 0
  end
end

def main
  puts "Choose a puzzle type (addition, subtraction, multiplication, division, prime_number, fibonacci):"
  puzzle_type = gets.chomp.to_sym

  code_breaker = CodeBreaker.new(puzzle_type)

  until code_breaker.game_over?
    puts "Enter your guess (4 digits):"
    guess = gets.chomp.split("").map(&:to_i)

    feedback = code_breaker.check_guess(guess)

    puts "Correct digits: #{feedback.correct_digits}"
    puts "Correct positions: #{feedback.correct_positions}"
  end

  puts "Congratulations! You broke the code."
end

main
