
$numGuesses = 0
$wasGuessed = false
$placeFound = nil

def guess(pin)    #Guesses PINs in common patterns.
#Pattern Guesses
    #Most common
    check(pin, "1234", :MOST_COMMON)
    
    if $wasGuessed;return;end
    check(pin, "4321", :MOST_COMMON)
    
    if $wasGuessed;return;end
    check(pin, "9876", :MOST_COMMON)
    
    #Center of PIN pad
    if $wasGuessed;return;end
    check(pin, "2580", :KEYPAD)
    
    #Center of keyboard numpad
    if $wasGuessed;return;end
    check(pin, "8520", :KEYPAD)
    
    #All same num (Ex: 3333)
    if $wasGuessed;return;end
    for i in 0..9
        guess = i.to_s*4
        $numGuesses += 1
        
        if check(pin, guess, :ALL_SAME)
            return
        end
    end
    
    #Many similar numbers (Ex: 7737)
    if $wasGuessed;return;end
    for digit in 0..3    #Cycles through which digit to change
        for i in 0..9
            for j in 0..9
                guess = j.to_s*4
                guess[digit] = i.to_s    #Changes 1 digit
                if check(pin, guess, :MANY_SAME)
                    return
                end
            end
        end
    end
    
    #Couplets (Ex: 2424)
    if $wasGuessed;return;end
    for i in 0..9
        for j in 0..9
            guess = (i.to_s + j.to_s)*2
            
            if check(pin, guess, :COUPLETS)
                return
            end
        end
    end
    
    #Palindromes (Ex: 9559)
    if $wasGuessed;return;end
    for i in 0..9
        for j in 0..9
            guess = (i.to_s + j.to_s)
            guess += guess.reverse
            
            if check(pin, guess, :PALINDROME)
                return
            end
        end
    end

#Date Guesses
     #MM/YY
     guessDate(1, 12, 1, 99, pin)
    
     #DD/MM
     if $wasGuessed;return;end
     guessDate(1, 31, 1, 12, pin)
    
     #MM/DD
     if $wasGuessed;return;end
     guessDate(1, 12, 1, 31, pin)
     
     #YYYY
     if $wasGuessed;return;end
     guessDate(19, 20, 0, 99, pin)

#Bruteforce
     if $wasGuessed;return;end
     bruteforce(pin)
end
    
def guessDate(min1, max1, min2, max2, pin)   #Guesses PINs in date formats
    for i in min1..max1
        for j in min2..max2
            if i < 10
                half1 = twoDigitNum(i)
            else
                half1 = i.to_s
            end
            
            if j < 10
                half2 = twoDigitNum(j)
            else
                half2 = j.to_s
            end
            
            guess = half1 + half2
            
            if check(pin, guess, :DATES)
                return
            end
        end
    end
end
    
def bruteforce(pin)
    for i in 0..9
        for j in 0..9
            for k in 0..9
                for l in 0..9
                    guess = i.to_s + j.to_s + k.to_s + l.to_s
                    
                    if check(pin, guess, :BRUTEFORCE)
                        return
                    end
                end
            end
        end
    end
end

def showResults(pin)
    puts "\nTook #{$numGuesses} tries to find #{pin}."
    
    case $placeFound
        when :MOST_COMMON, :ALL_SAME
            puts "Really. I hope you don't actually use this as your real PIN."
        when :KEYPAD
            puts "Anyone could guess that immediately! Those are the center numbers of a keypad!"
        when :MANY_SAME, :COUPLETS, :PALINDROME
            puts "Any good guessing algorithm finds simple-to-remember patterns first! A person might be able to guess this, too, if they're patient."
        when :DATES
            puts "An algorithm might guess dates, because they're memorable (although you might not have intended your PIN to be one). And a person can figure out what dates are important to you and guess it, too (if you *did* intent it to be one)."
        when :BRUTEFORCE
            puts "Your PIN is harder for an algorithm or person to guess. Good choice!"
    end
end

def check(pin, guess, loc)
    $numGuesses += 1
    
    if pin.to_s == guess.to_s
        $wasGuessed = true
        $placeFound = loc
        return true
    else
        return false
    end
end

def twoDigitNum(inNum)    #Returns 2-digit number as string
    return "0" + inNum.to_s
end

puts "Enter a 4-digit PIN:\t"
pin = gets.chomp

while pin.length != 4
    if pin.length != 4
        puts "Must be 4 digits! Try again:\t"
    end
    
    pin = gets.chomp
end

guess(pin)
showResults(pin)
