require_relative "book"
require_relative "user"
require_relative "library"


# Creating instances of "Book"
book1 = Book.new("A Game of Thrones", "George RR Martin", "fantasy", "available", "paperback", 10)
book2 = Book.new("1984", "George Orwell", "dystopian", "on loan", "paperback", 0)
book3 = Book.new("The Handmaid's Tale", "Margaret Atwood", "dystopian", "available", "hardback", 4)
book4 = Book.new("Gone Girl", "Gillian Flynn", "thriller", "on loan", "hardback", 2)
book5 = Book.new("Good Omens", "Terry Pratchet & Neil Gaiman", "comedy", "on loan", "hardback", 1)

# Creating array to store the different books 
books = [book1, book2, book3, book4, book5]

# Calculating the total number of books 
numberBooks = (book1.copies_available + book2.copies_available +  book3.copies_available + book4.copies_available + book5.copies_available)

# Creating an array of books that are currently out on loan
books_borrowed = [books[2], books[4], books[0]]

# Calculating how many books are currently available 
books_available = books.length - books_borrowed.length

# Creating instances of "User"
person1 = User.new("Michael", "Johnson", "Blanchardstown", "0869252525", "active", [books[2]])
person2 = User.new("Lucy", "Jones", "Stillorgan", "0897864452", "active", [books[0]])
person3 = User.new("Ben", "Connolly", "Ratoath", "0825635452", "expired", [books[0]])

# Creating an array to store all users 
users = [person1, person2, person3]

# Creating an instance of the library 
theLibrary = Library.new(books, numberBooks, books_borrowed.length, books_available)

class Top
	""" Class to combine book, user and library classes""" 

	attr_accessor :books, :users, :library

	def initialize(books, users, library)
		# Initialize the other class objects within this class 
		@books = books 
		@users = users 
		@library = library		
	end

	def run()
		# Print out the current status of the library before any event 		
		@library.current_state

		# Carrying out a borrowing event in the library 
		# User Lucy Jones takes out Good Omens
		@library.borrow_book(users[1], books[0])

		# Show new current state of the library after event has taken place 
		@library.current_state

		# Print the current user status 
		@users[1].user_info

		# Print the current status of the book
		@books[0].print_status

	end

end 

example = Top.new(books, users, theLibrary)
example.run