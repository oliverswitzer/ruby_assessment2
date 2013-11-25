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






#5. Object Orientation

class School 

	attr_accessor :name, :location, :instructors, :students, :founded_in

	def initialize(name, location, instructors, students, founded_in)
		@name = name
		@location = location
		@instructors = instructors
		@students = students
		@founded_in = founded_in
	end

	#b
	def add_student name, grade
		@students << {:name => "#{name}", :grade => "#{grade}"}
	end

	#c
	def rm_student name
		@students.each_with_index do |student_hash, i|
			if @students[:name] == "#{name}"
				@students.delete_at(i)
			end
		end
	end

	#d
	def add_semester semester
		@students.each do |student_hash|
			student_hash[:semester] = "#{semester}"
		end
	end

	#e 
	def change_subject instructor, subject
		@instructors.each do |instructor_hash|
			instructor_hash.each do |key, value|
				if key == :name && value == instructor
					@instructors[instructor_hash][:subject] = subject
				end
			end
		end
	end

	#f
	def change_grade student_name, new_grade
		@students.each do |student_hash|
			if student_hash[:name] == student_name
				student_hash[:grade] = new_grade
			end
		end
	end

	#g
	def return_student_with_grade grade
		@students.each do |student_hash|
			if student_hash[:grade] == grade
				return student_hash[:name]
			end
		end
		
	end

	#h 
	def return_subject instructor
		subj = ""
		@instructors.each do |instructor_hash|
			if instructor_hash[:name] == instructor
				subj = instructor_hash[:subject]
			end
		end
		subj
	end
	#i
	def return_all_values
		puts @name
		puts @location

		@instructors.each do |instructor_hash|
			instructor_hash.each do |k, v|
				puts v
			end
		end

		@students.each do |student_hash|
			student_hash.each do |k, v|
				puts v
			end
		end

		puts @ranking
	end

end



#a
flatiron = School.new(school[:name],school[:location],school[:instructors], school[:students], 2013)


puts flatiron.return_student_with_grade("B")



