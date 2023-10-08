class Question
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Game
  def initialize
    @questions = [
      Question.new("What is the capital of France?", "Paris"),
      Question.new("Who wrote 'To Kill a Mockingbird'?", "Harper Lee"),
      Question.new("What is the chemical symbol for Hydrogen?", "H")
    ]
    @score = 0
  end

  def start
    puts "Welcome to Trivia Game!"
    
    @questions.each do |question|
      puts question.question
      print "Your answer: "
      user_answer = gets.chomp
      
      if user_answer.downcase == question.answer.downcase
        puts "Correct!"
        @score += 1
      else
        puts "Sorry, that's incorrect. The correct answer is #{question.answer}."
      end
    end
    
    puts "Game over! Your score was #{@score}."
  end
end

game = Game.new
game.start
