module HANGMAN
    class HangMan
        def initialize
            @ran=rand 5
            @questions = [
                {"question" => "I'm something you read", "answer" => "book"}, 
                {"question" => "I'm something in a tree",
                "answer" => "apple"},
                {"question" => "I'm a horse", "answer" => "zebra"},
                {"question" => "This game was made with?", "answer" => "ruby"},
                {"question" => "Im so tired", "answer" => "sleep"}
            ]
            @q = @questions[@ran]['question']
            @a = @questions[@ran]['answer']
            @word_teaser = ""
            @lives = 5
            @score = 0
            @guess_streak = 0
            @a.size.times do
                @word_teaser += "_ "
            end
        end

        def add_score
            @score += (@ran * @guess_streak) 
        end

        def hangman
            puts "----" if @lives <= 4
            puts "   |" if @lives <= 3
            puts "   0" if @lives <= 2
            puts "  /|\\ " if @lives <= 1
            puts "  / \\ " if @lives <= 0
        end

        def update_teaser guess
            new_teaser = @word_teaser.split

            new_teaser.each_with_index do |letter, index|
                if letter == '_' && @a[index] == guess
                    new_teaser[index] = guess
                end
            end

            @word_teaser = new_teaser.join(' ')
        end

        def print_teaser guess = nil
            update_teaser(guess) unless guess.nil?
            puts @word_teaser
        end

        def makeguess 
            if @lives <= 0
                puts "Gameover! You have a total of #{ @score } scores and #{ @guess_streak } Streak"  
                print_teaser
                hangman
                puts "You failed! Better luck next time bud :/"
                exit()
            end

            hangman
            puts "Clue: #{ @q }"
            puts "Enter a letter: "
            input=gets.chomp.downcase.to_s
            guess = @a.include? input
            if input.downcase == "exit"
                puts "Exiting HangMan Games, thanks for playing!"
            end

            if @lives >= 1
                if  input.length == 0 and input.length < 1 or input.length > 1
                    puts "Please guess one letter per-promt"
                    makeguess
                
                elsif guess
                    print_teaser input
                    @guess_streak += 1
                    @score += add_score
                    if @a == @word_teaser.split.join
                        puts "Game Completed! You won this game with a total of #{ @score } scores and #{ @lives } lives!"
                    else
                        puts "Correct answer! Now you have #{ @score } scores and #{ @lives } lives!"
                        makeguess
                    end
                else
                    @lives -= 1
                    @score -= 20 if @score > 0
                    @guess_streak = 0
                    if @lives == 0
                        makeguess

                    else
                        puts "Wrong Answer! You have #{ @lives } lives left and #{ @score } scores. Try again!"
                        print_teaser
                        makeguess  
                    end
                end
            else
                @lives = 0
                print_teaser
                hangman 
            end
        end

        def start
            puts "Welcome To HangMan: Version 1.0.5\nNew game started! You have #{ @lives } chance to guess the word, Goodluck!"
            print_teaser
            makeguess
        end
    end
end
