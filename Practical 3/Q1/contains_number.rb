# Function to check if a string contains at least one number 

def contains_number?(password)
	if password.count("0-9") > 0 #https://stackoverflow.com/questions/2224790/how-do-i-check-if-a-string-has-at-least-one-number-in-it-using-ruby
		then true
	else
		false
	end
end

