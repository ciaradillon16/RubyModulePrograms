# Question 2
class FamilyMember
	attr_accessor :name,  :role, :sex, :status,  :age, :children

	def initialize(name, role, sex, status, age, children)
		@name = name
		@role = role
		@sex  = sex
		@status = status
		@age = age
		@children = children
	end

	def parent?
		# Predicate to check if the family member is a parent and which parent 
		if role == "father" and sex == "male" and children == "yes"
			then p name +  " is the father."
			true
		elsif role == "mother" and sex == "female" and children == "yes"
			then p name + " is the mother."
		else
			p name + " is not a parent."
			false
		end
	end

	def child? 
		# Predicate to check if the family member is a child and what type of child 
		if role != "mother" and role != "father"
			then p name + " is the " + role + "."
			true
		else
			p name + " is not a child."
		end
	end

end

fm1 = FamilyMember.new("John", "father", "male", "married", 50, "yes")
fm2 = FamilyMember.new("Susan", "mother", "female", "married", 52, "yes")
fm3 = FamilyMember.new("Lucy",  "daughter", "female", "single", 18, "no")
fm4 = FamilyMember.new("James", "son", "male", "underage", 12, "no")
fm5 = FamilyMember.new("Bilbo", "dog", "male", "single", 3, "no")

# Commented out as printing with other two functions and duplicating
# p fm1.parent?
# p fm2.parent?
# p fm3.child?
# p fm4.child?
# p fm5.child?





