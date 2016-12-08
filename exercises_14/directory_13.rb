@students = [] # an empty array accessible to all methods
@calendar = ['january', 'february', 'march', 'april', 'june', 'july', 'august', 'september', 'october', 'november', 'december']

def print_header
  puts
  puts "The students of Smokey Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.empty?
    puts "Oi! Heroes have prevailed, so there are no Smokey Villains left!"
  else
    @students.map { |student| student[:cohort] }.uniq.each do |cohort|
      puts "#{cohort} cohort:"
      @students.select { |student| student[:cohort] == cohort }.each do |student|
        puts "#{student[:name]}"
      end
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great #{ @students.count == 1 ? "student" : "students"}."
  puts
end

def input_students
  puts "Please enter the student's name (hit return), then their respective cohort (hit return)."
  puts "To finish, just hit return twice."
  name = STDIN.gets.chomp
  name = "Default Name" if name == ''
  cohort = STDIN.gets.chomp
  cohort = "November" if cohort == '' || !@calendar.include?(cohort.downcase)
    while (name != 'Default Name' || cohort != 'November') do
    enrol(@students, name, cohort)
    puts "Now we have #{@students.count} #{ @students.count == 1 ? "student" : "students"}."
    name = STDIN.gets.chomp
    name = "Default Name" if name == ''
    cohort = STDIN.gets.chomp
    cohort = "November" if cohort == '' || !@calendar.include?(cohort.downcase)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
  puts
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
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts
      puts "I don't know what you mean, please try again."
      puts
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    enrol(@students, name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit # quit the program
  end
end

def enrol(directory, student_name, student_cohort)
  directory << {name: student_name, cohort: student_cohort.to_sym}
end

try_load_students
interactive_menu
