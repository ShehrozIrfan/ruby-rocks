r = rand (1..3)

puts ("Choose rock paper or scissors...")
user = gets.chomp.downcase

puts ("You chose: #{user}")

case r
when 1
  rival = 'rock'
when 2
  rival = 'paper'
when 3
  rival = 'scissors'
end

puts ("They chose: #{rival}")

#user chooses rock

if user == 'rock'
    if rival == 'rock'
        puts ("It's a draw!")
    elsif rival == 'paper'
        puts ("You lose")
    else 
        puts ("You win")
    end 
end 

#user chooses paper

if user == 'paper'
    if rival == 'paper'
        puts ("It's a draw")
    elsif rival == 'scissors'
        puts ("You lose")
    else 
        puts ("You win")
    end 
end 

#user chooses scissors 

if user == 'scissors'
    if rival == 'scissors'
        puts ("It's a draw")
    elsif rival == 'rock'
        puts ("You lose")
    else 
        puts ("You win")
    end 
end 
