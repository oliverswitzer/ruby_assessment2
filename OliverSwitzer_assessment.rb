#assessment.rb
require 'debugger'
require 'awesome_print'

#1. Arrays

 array = ["Blake","Ashley","Jeff"]

 array << "New Element"
 array.each {|elem| puts elem}
 array[1]
 array.index("Jeff")

#2. Hashes

instructor = {:name=>"Ashley", :age=>27}

instructor[:location] = "NYC"
instructor.each {|k, v| puts "#{k}: #{v}"}
instructor[:name]
instructor.key(27)

#3. Nested Structures 

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

#a
school[:founded_in] = 2013
#b
school[:students] << {:name => "Bob", :grade => "F"}
puts school[:students]

#c
school[:students].each_with_index do |student_hash, i|
	if student_hash[:name] == "Billy"
		school[:students].delete_at(i)
	end
end
puts school

#d
school[:students].each do |student_hash|
	student_hash[:semester] = "Summer"
end
#e
school[:instructors][1][:subject] = "being almost better than Blake"
ap school

#f
school[:students].each do |student_hash|
	if student_hash[:name] == "Frank"
		student_hash[:grade] = "F"
	end
end

#g
puts "3-g."
school[:students].each do |student_hash|
	if student_hash[:grade] == "B"
		puts student_hash[:name]
	end
end

#h
puts "3-h."
school[:instructors].each do |instructor_hash|
	if instructor_hash[:name] == "Jeff"
		puts instructor_hash[:subject]
	end
end

#i
puts "3-i. "
puts school[:name]
puts school[:location]

school[:instructors].each do |instructor_hash|
	instructor_hash.each do |k, v|
		puts v
	end
end

school[:students].each do |student_hash|
	student_hash.each do |k, v|
		puts v
	end
end

puts school[:ranking]

#4 Methods
#a
def return_grade student_name, school
	school[:students].each do |student_hash|
		if student_hash[:name] == student_name
			return student_hash[:grade]
		end
	end
end
#b
def change_subject instructor, subject, school
	school[:instructors].each do |instructor_hash|
		instructor_hash.each do |key, value|
			if key == :name && value == instructor
				instructor_hash[:subject] = subject
			end
		end
	end
	school[:instructors]
end
#c
def add_student name, grade, semester, school
	school[:students] << {:name => "#{name}", :grade => "#{grade}", :semester => "#{semester}"}
	school[:students]
end
#d
def add_key key, value, school
	school[key] = value
	return school
end

puts "4-a"
puts return_grade("Marissa", school)

puts "4-b"
puts change_subject("Blake", "being terrible", school)

puts "4-c"
puts add_student("Oliver", "Z+", "Winter", school)

puts "4-d"
puts add_key(:Ranking, "1", school)

#5. Object Orientation
puts "_"*50
puts "5. Object Orientation"



#a
class School 

	#c
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking, :schools

	

	#b i-iii
	def initialize(name, location, instructors, students, ranking)
		@name = name
		@location = location
		@instructors = instructors
		@students = students
		@ranking = ranking
		#g.  (NOTE: I don't know how to reset constants or access class variables
		 # so I made schools an instance variable) 
		@schools  = []
		@schools << self
	end

	#d
	def set_ranking rank
		@ranking = rank
		@ranking
	end

	#e
	def add_student name, grade, semester
		@students << {:name => "#{name}", :grade => "#{grade}", :semester => "#{semester}"}
	end

	#f
	def rm_student name
		@students.each_with_index do |student_hash, i|
			if student_hash[:name] == "#{name}"
				@students.delete_at(i)
			end
		end
		@students
	end

	#h
	def reset 
		@schools = []
	end
	
end



# b. iii
flatiron = School.new(school[:name],school[:location],school[:instructors], school[:students], 1)


#d
puts "5-d"
puts flatiron.set_ranking(2)

#e
puts "5-e"
puts flatiron.add_student("Oliver", "Z-", "Winter")

#f
puts "5-f"
puts flatiron.rm_student("Bob")

#h
puts "5-h"
puts flatiron.schools
puts flatiron.reset
puts flatiron.schools.inspect

#6 Classes

#a. 
class Student

	attr_accessor :name, :grade, :semester

	def initialize name, grade, semester
		@name = name
		@grade = grade
		@semester = semester
	end
end

class SchoolRefactored 

	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking, :schools

	
	def initialize(name, location, instructors, students, ranking)
		@name = name
		@location = location
		@instructors = instructors
		@students = students
		@ranking = ranking
		 
		@schools  = []
		@schools << self
	end

	def find_student student_name
		student_return = @students.select {|student| student.name == student_name}
		student_return[0]
	end

end

student_objects = []

school[:students].each do |student_hash|
	student_objects << Student.new(student_hash[:name], student_hash[:grade], student_hash[:semester])
end

puts student_objects

flatiron_refact = SchoolRefactored.new(school[:name],school[:location], school[:instructors], student_objects, 1)

#c 
puts "6-c"
puts "Here's the student object of Marissa"
puts flatiron_refact.find_student("Marissa")

#7. Self


  # a.What should this Class print to the screen when defined/loaded?

  # ```ruby
  # class Student

  #   def self.say_hello
  #     puts "hello"
  #   end

  #   say_hello
  #   puts self

  # end
  # ```

  # b. What should this Class print to the screen when defined/loaded?

  # ```ruby
  # class Student

  #   def self.say_hello
  #     puts self
  #   end

  #   say_hello

  # end
  # ```

  # c. What should this Class print to the screen when defined/loaded?

  # ```ruby
  # class Student

  #   def initialize
  #     puts self
  #   end

  #   new

  # end
  # ```

  # d. What should this code print to the screen when run?

  # ```ruby
  # class Student

  #   def say_hello
  #     puts self
  #   end

  # end
  # ```

  # Student.new.say_hello

  # e. What should this code print to the screen when run?

  # ```ruby
  # class Student

  #   def say_hello
  #     puts say_goodbye
  #   end

  #   def say_goodbye
  #     "goodbye"
  #   end

  # end
  # ```

  # Student.new.say_hello

