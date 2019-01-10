class Library
	"""Class to create a library object""" 

	attr_accessor = :books, :number_books, :number_borrowed, :num_books_available

	def initialize(books, numBooks, numBorrowed, books_available)
		# Method to initialise instance variables for the library object  
		@books = books 
		@number_books = numBooks
		@number_borrowed = numBorrowed
		@books_available = books_available 	
	end


	def current_state
		# Method to print out the current status of the library - the number of books in total, out on loan and available to borrow 
		if @number_books > 0 then
			puts "The current number of books available is #{@number_books} "
			puts "================" 
			puts "These books are: "
			@books.each {|book| p book.title +  " and there are #{book.copies_available} available"}
			puts "================" 
		else puts "There are currently no books available to loan."
		end
	end

	def borrow_book(user, book)
		# Method to carry out a borrowing event in the library 
		# Updates the amount of books available in total, on loan and available to borrow 
		puts "#{user.firstname} #{user.surname} has requested to borrow #{book.title}"
		puts "================"

		if @books.include?(book) then
			puts "Sucessfully borrowed #{book.title}. You have four weeks to read this book."
			puts "================"

			@number_books = @number_books - 1
			@number_borrowed = @number_borrowed + 1 
			@books_available = @books_available -  1
			book.copies_available = book.copies_available - 1 

			if book.copies_available == 0; 
				@books.delete(book); 
			end 

			true

		else 
			puts "Sorry, this book is currently unavailable"
		end 
	end 
end 