def print_header
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} - " + "cohort: #{student[:cohort]}, ".center(20)  + "hobbies: #{student[:hobbies]}, ".center(20) + "country of birth: #{student[:countryofbirth]}, ".center(25) + "height: #{student[:height]}.".center(15)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: :evilmongery, countryofbirth: :Mordor, height: 200}
    puts "Now we have #{students.count} students"
    #gets another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
