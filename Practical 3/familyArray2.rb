# Calling local file "family.rb"
require_relative 'family'

# Recreating instanes of family member class 
fm1 = FamilyMember.new("John", "father", "male", "married", 50, "yes")
fm2 = FamilyMember.new("Susan", "mother", "female", "married", 52, "yes")
fm3 = FamilyMember.new("Lucy",  "daughter", "female", "single", 18, "no")
fm4 = FamilyMember.new("James", "son", "male", "underage", 12, "no")
fm5 = FamilyMember.new("Bilbo", "dog", "male", "single", 3, "no")

familyArray = [fm1, fm2, fm3, fm4, fm5]

def print_details(array)
	array.each do |item|
		puts item.name, item.role, item.sex, item.status, item.age, item.children
	end
end

print_details(familyArray)