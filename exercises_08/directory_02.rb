def print_header
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print(students)
  if students.empty?
    puts "Directory is empty or no student's name begin with selected letter."
  else
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students whose names begin with the letter(s) you selected."
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
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #gets another name from the user
    name = gets.chomp
  end
  students
end

def specify_letter(students)
  puts "What letter do you want to select? Hit return to see all."
  letter = gets.chomp
  return students if letter == ''
  students.select! { |student| student[:name][0].downcase == letter.downcase }
end

students = input_students
specify_letter(students)
print_header
print(students)
print_footer(students)
