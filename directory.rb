@students = [] # an empty array accessible to all methods
@calendar = ['january', 'february', 'march', 'april', 'june', 'july', 'august', 'september', 'october', 'november', 'december']

def print_header
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.empty?
    puts "Oi! Heroes have prevailed, so there are no Smokey Villains left!"
  else
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]}) - " + "hobbies: #{student[:hobbies]}, ".center(20) + "country of birth: #{student[:countryofbirth]}, ".center(25) + "height: #{student[:height]}.".center(15)
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{ @students.count == 1 ? "student" : "students"}."
end

def input_students
  puts "Please enter the student's name (hit return), then their respective cohort (hit return)."
  puts "To finish, just hit return twice."
  name = gets.chomp
  name = "Default Name" if name == ''
  cohort = gets.chomp
  cohort = "November" if cohort == '' || !@calendar.include?(cohort.downcase)
    while (name != 'Default Name' || cohort != 'November') do
    @students << {name: name, cohort: cohort.to_sym, hobbies: :evilmongery, countryofbirth: :Mordor, height: 200}
    puts "Now we have #{@students.count} #{ @students.count == 1 ? "student" : "students"}."
    name = gets.chomp
    name = "Default Name" if name == ''
    cohort = gets.chomp
    cohort = "November" if cohort == '' || !@calendar.include?(cohort.downcase)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
