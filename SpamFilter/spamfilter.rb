class SpamFilter

	def makeString(email)
		# Takes content from email and parses to string
		string = ""
		File.open(email).each { |line| string += line }
		return string
	end 

	def makeArray(email)
		# Takes paragraphs and splits each word into an array of its own
		array = email.split(' ')
		return array
	end 

	def is_spam?(email_array, spam_checklist)
		# Checks word arrays against
		words = []

		# Count required to keep track of spam words 
		count =  0

		# Check the words in the spam checklist against the words in the email array
		spam_checklist.each do |word|
			words = email_array.select{|spamWord| spamWord =~ word} 

			# Add matching words to empty array
			if words.length > 0 then
				count += 1
			end 
		end 

		if count > 0 then 
			puts "This email appears to be spam"
			true
		else
			puts "This email is probably not spam"
			false
		end 
	end 
end

# Calling all email files in an array
email_files = ['emailFiles/email1.txt', 'emailFiles/email2.txt', 'emailFiles/email3.txt',
				'emailFiles/email4.txt', 'emailFiles/email5.txt', 'emailFiles/spam1.txt',
				'emailFiles/spam2.txt', 'emailFiles/spam3.txt', 'emailFiles/spam4.txt',
				'emailFiles/spam5.txt']

# Creating a new SpamFilter object 
spamFilter = SpamFilter.new()

# Empty array to hold all email strings
email_strings = []

# Empty array to hold all email arrays 
email_arrays = []

# Spam checklist of words 
spam_checklist = [/sale/, /free/, /special/, /1 click/, /offers/, /offer/,
			/[Aa]ttention/, /winner/, /won/, /miss out/]

#  Invoke makeString on each email file 
email_files.each { | files | email_strings << spamFilter.makeString(files) }

# Invoke makeArray on each email string 
email_strings.each { | email_strings | email_arrays << spamFilter.makeArray(email_strings) }

# Invoke is_spam? on each email array
email_arrays.each { | email_arrays | spamFilter.is_spam?(email_arrays, spam_checklist) }

