# Function to check if a password is valid 

require_relative "check_length"
require_relative "contains_number"

def check_valid_password
	puts "Enter a password (Minimum 8 characters and at least one number): "
	password = gets

	# Invokes other two functions to check password is ok
	if check_length?(password) and contains_number?(password)
		p ("Password ok!")
	end 
end 

check_valid_password
