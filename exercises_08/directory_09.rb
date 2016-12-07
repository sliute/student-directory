def print_header
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print(students)
  students.map { |student| student[:cohort] }.uniq!.each do |cohort|
    students.select { |student| student[:cohort] == cohort }.each do |student|
      puts "#{cohort}: #{student[:name]}, " + "hobbies: #{student[:hobbies]}, ".center(20) + "country of birth: #{student[:countryofbirth]}, ".center(25) + "height: #{student[:height]}.".center(15)
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the student's name (hit return), then their respective cohort (hit return)."
  puts "To finish, just hit return twice in a row."
  # create an empty array
  students = []
  calendar = ['january', 'february', 'march', 'april', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  # get the first name
  name = gets.chomp
  # provide a default value for name if the input is empty
  name = "Default Name" if name == ''
  cohort = gets.chomp
  cohort = "November" if cohort == '' || !calendar.include?(cohort.downcase)
  #while either the name or the cohort are provided, repeat this code and provide default values for any empty inputs
  while (name != 'Default Name' || cohort != 'November') do
    # add the student hash to the array, with the cohort converted to a symbol
    students << {name: name, cohort: cohort.to_sym, hobbies: :evilmongery, countryofbirth: :Mordor, height: 200}
    puts "Now we have #{students.count} #{ students.count == 1 ? "student" : "students"}."
    #gets another name-cohort pair from the user
    name = gets.chomp
    name = "Default Name" if name == ''
    cohort = gets.chomp
    cohort = "November" if cohort == '' || !calendar.include?(cohort.downcase)
  end
  # return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)
