class Rotor
  attr_accessor :notches

  def initialize(notches)
    @notches = notches
  end

  def notch
    @notches.sample
  end
end

class CodeBreakerEnigma
  attr_accessor :code, :rotors, :reflector

  def initialize(rotors, reflector)
    @rotors = rotors
    @reflector = reflector
    @code = generate_code
  end

  def generate_code
    Array.new(3) { @rotors.sample.notch }
  end

  def encrypt(letter)
    letter = @rotors[0].encrypt(letter)
    letter = @rotors[1].encrypt(letter)
    letter = @rotors[2].encrypt(letter)
    letter = @reflector.encrypt(letter)
    letter = @rotors[2].decrypt(letter)
    letter = @rotors[1].decrypt(letter)
    letter = @rotors[0].decrypt(letter)
    letter
  end

  def decrypt(letter)
    letter = @rotors[0].decrypt(letter)
    letter = @rotors[1].decrypt(letter)
    letter = @rotors[2].decrypt(letter)
    letter = @reflector.decrypt(letter)
    letter = @rotors[2].encrypt(letter)
    letter = @rotors[1].encrypt(letter)
    letter = @rotors[0].encrypt(letter)
    letter
  end

  def game_over?
    @code == @rotors.map(&:notch)
  end

  def check_guess(guess)
    feedback = Feedback.new

    guess.each_with_index do |letter, index|
      if letter == @code[index]
        feedback.correct_letters += 1
        feedback.correct_positions += 1
      end
    end

    feedback
  end

  def get_rotors
    @rotors
  end

  def get_reflector
    @reflector
  end
end

class Feedback
  attr_accessor :correct_letters, :correct_positions

  def initialize
    @correct_letters = 0
    @correct_positions = 0
  end
end

def main
  rotors = [Rotor.new([1, 2, 3]), Rotor.new([4, 5, 6]), Rotor.new([7, 8, 9])]
  reflector = "D"

  code_breaker_enigma = CodeBreakerEnigma.new(rotors, reflector)

  until code_breaker_enigma.game_over?
    puts "Enter your guess (3 letters):"
    guess = gets.chomp.split("").map(&:upcase)

    feedback = code_breaker_enigma.check_guess(guess)

    puts "Correct letters: #{feedback.correct_letters}"
    puts "Correct positions: #{feedback.correct_positions}"
  end

  if code_breaker_enigma.game_over?
    puts "Congratulations! You broke the code."
  else
    puts "Sorry, you ran out of guesses."
  end
end
main
