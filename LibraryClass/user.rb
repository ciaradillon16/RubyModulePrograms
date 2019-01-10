class User
	"""Class to store user information for the library"""

	# Creating an array class variable to store unique user IDs
	@@member_ids = []
	attr_accessor :firstname, :surname, :address, :id, :phone, :membership, :books_borrowed

	def initialize(fname, sname, address, phone, membership, books_borrowed)

		@firstname = fname 
		@surname = sname
		@address = address
		@id = id
		@phone = phone
		@membership = membership
		@books_borrowed = books_borrowed

		# To create a unique ID for each  user in the library 
		if @@member_ids.length < 1 then
				@id = 1
				@@member_ids << 1
			else 
				@id=@@member_ids[-1] + 1
				@@member_ids << @id
		end
end 

	def user_info
		# Method to display information about books that a user has on display 
		if @books_borrowed.length > 0 then
			puts "#{@firstname} #{@surname} has #{@books_borrowed.length} items on loan."
			puts "================"
			puts "These books are: "
				@books_borrowed.each { |book| p book.title}
			puts "================"
		else puts "This user does not have any books on loan at the moment"
		end 
	end 
end

