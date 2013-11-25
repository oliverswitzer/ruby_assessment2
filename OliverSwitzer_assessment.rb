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
	attr_reader :ranking

	#g.  (NOTE: I don't know how to reset constants so I made schools a variable) 
	@@schools  = []

	#b i-iii
	def initialize(name, location, instructors, students, ranking)
		@name = name
		@location = location
		@instructors = instructors
		@students = students
		@ranking = ranking
		@@schools << self
	end

	#d
	def set_ranking rank
		@ranking = rank
	end

	#e
	def add_student name, grade, semester
		@students << {:name => "#{name}", :grade => "#{grade}", :semester => "#{semester}"}
	end

	#f
	def rm_student name
		@students.each_with_index do |student_hash, i|
			if @students[:name] == "#{name}"
				@students.delete_at(i)
			end
		end
	end

	#h
	def reset 
		@@schools = []
	end
	
end



# #a
# flatiron = School.new(school[:name],school[:location],school[:instructors], school[:students], 2013)


# puts flatiron.return_student_with_grade("B")



