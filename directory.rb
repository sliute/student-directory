def print_header
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print(students)
  if students.empty?
    puts "Oi! Heroes have prevailed, so there are no Smokey Villains left!"
  else
    students.map { |student| student[:cohort] }.uniq!.each do |cohort|
      students.select { |student| student[:cohort] == cohort }.each do |student|
        puts "#{cohort}: #{student[:name]}, " + "hobbies: #{student[:hobbies]}, ".center(20) + "country of birth: #{student[:countryofbirth]}, ".center(25) + "height: #{student[:height]}.".center(15)
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the student's name (hit return), then their respective cohort (hit return)."
  puts "To finish, just hit return twice in a row."
  students = []
  calendar = ['january', 'february', 'march', 'april', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
  # get the first name and use strip instead of chomp
  name = gets.strip
  name = "Default Name" if name == ''
  cohort = gets.strip
  cohort = "November" if cohort == '' || !calendar.include?(cohort.downcase)
  #while either the name or the cohort are provided, repeat this code and provide default values for any empty inputs
  while (name != 'Default Name' || cohort != 'November') do
    # add the student hash to the array, with the cohort converted to a symbol
    students << {name: name, cohort: cohort.to_sym, hobbies: :evilmongery, countryofbirth: :Mordor, height: 200}
    puts "Now we have #{students.count} #{ students.count == 1 ? "student" : "students"}."
    #gets another name-cohort pair from the user and use gsub with parameters instead of chomp
    name = gets.gsub(/\n/, '')
    name = "Default Name" if name == ''
    cohort = gets.gsub(/\n/, '')
    cohort = "November" if cohort == '' || !calendar.include?(cohort.downcase)
  end
  # return the array of students
  students
end

def interactive_menu
  students = []
  loop do
    #1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    #2. read the input and save it into a variable
    selection = gets.chomp
    #3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
