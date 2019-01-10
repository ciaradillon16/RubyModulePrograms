# Code based on the Country/Region example in the slide
# Some additional understanding of relationships from https://guides.rubyonrails.org/association_basics.html#the-belongs-to-association

# ----- Loading in required libraries  -----

require 'active_record'
require 'time'

#  ----- Setting up database connection -----

ActiveRecord::Base.establish_connection(
                      :adapter => "sqlite3",
                      :database => "practical9")

# ----- Creating the tables -----

class Library < ActiveRecord::Migration[4.2]

  def self.up
    create_table :readers  do | table |
      table.column :name, :string
      table.column :age, :string
      #  Not too sure what to do with this attribute 
      table.column :books_borrowed, :integer
    end

    create_table :books do | table |
      table.column :reader_id, :integer
      table.column :title, :string
      table.column :author, :string
      table.column :borrowed_when, :integer
      table.column :dueback, :integer
    end
  end

  def self.down
    drop_table :readers
    drop_table :books
  end
end

# ----- Creating classes for database tables -----

# Basing relationships on lecture notes - Country and Regions
# A Reader can borrow many books, and an individual book has one reader (at at time?)

class Reader < ActiveRecord::Base
  has_many :books

end
class Book < ActiveRecord::Base
  belongs_to  :readers
end

#  ----- Creating database -----

Library.up

# ----- Creating records -----

# Creating reader records
reader1 = Reader.create(:name => "Ciara", :age => 22, :books_borrowed => 2)
reader2 = Reader.create(:name => "Luke", :age => 12, :books_borrowed => 1)


# Creating book records
reader1.books.create(:title  => "The Handmaid's Tale",
                     :author => "Margaret Atwood",
                     :borrowed_when => Time.now,
                     :dueback => Time.now +  1814400)  # 3 weeks in seconds


reader1.books.create(:title =>  "My Sister's Keeper",
                    :author =>  "Jodi Picoult",
                    :borrowed_when => Time.now,
                    :dueback => Time.now +  1814400)

reader2.books.create(:title =>  "The Cat in the Hat",
                    :author =>  "Dr. Seuss",
                    :borrowed_when => Time.now,
                    :dueback => Time.now +  1814400)

# ----- Implementing "find" on this database -----

puts "-----------  Printing all book and reader objects -----------"
# Return all Readers
p Reader.all

# Return all Books
p Book.all

puts "-----------  Printing information about book with ID 2 -----------"
p Book.find(2).title
p Book.find(2).author
# Not an efficient way to do this I know!
reader = Book.find(2).reader_id
p Reader.find(reader).name

puts "-----------  Finding book object by title -----------"
book1 = Book.find_by_title("The Handmaid's Tale")
puts "ID: " + book1.to_s
puts "Title: " + book1.title
puts "Author: " + book1.author

puts "-----------  Finding reader by name -----------"
reader_luke = Reader.find_by_name("Luke")
puts "ID: " + reader_luke.to_s
puts "Name: " + reader_luke.name
puts "Age: " + reader_luke.age


puts "-----------  Finding reader by age -----------"
reader_age_22 = Reader.find_by_age(22)
puts "ID: " + reader_age_22.to_s
puts "Name: " + reader_age_22.name
puts "Age: " + reader_age_22.age

# ----- Deleting database -----

Library.down

# ---- Remove connection to database once complete -----

ActiveRecord::Base.remove_connection