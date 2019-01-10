class Book
	"""Class to create book objects for use in the library"""

	# Array to hold all unique ids for each book in the library 
    @@isbns = []
	attr_accessor :title, :author, :isbn, :genre, :status, :type, :copies_available

	def initialize(title, author, genre, status, type, copies_available)
		# Intializing instance variables  
		@title = title
		@author = author
		@genre = genre
		@status = status
		@type = type
		@copies_available = copies_available

		# Assign a unique ISBN to each book object 
		if @@isbns.length < 1 then
			@isbn = 1
			@isbn << 1
		else 
			@isbn = @@isbns[-1] + 1
			@@isbns << @isbn
		end 
	end 

	def print_status
		# Print the current status of the book i.e. whether or not it is available and how many copies there are 
		if @copies_available == 1 then
			puts "The book #{@title} by #{@author} is currently #{@status} and there is #{@copies_available} copy available"
		elsif @copies_available == 0 then
			puts "The book #{@title} by #{@author} is currently #{@status}" 
		else 
			puts "The book #{@title} by #{@author} is currently #{@status} and there are #{@copies_available} copies available"
		end
	end

end 

