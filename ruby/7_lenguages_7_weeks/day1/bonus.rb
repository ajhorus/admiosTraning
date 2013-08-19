puts "Try to guess the ramdon number between 0 and 10"

def getRamdonNumber
	return rand 11 
end

def evaluateNumber number
	guess = getRamdonNumber
	if number.to_i == guess
		puts "Wiiii you Win a candy"
	else
		puts "You lose insert a coin"
		puts "The correct number was #{guess}"
	end
end

evaluateNumber gets.chomp
