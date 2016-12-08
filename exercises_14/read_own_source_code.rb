puts "Here's what's inside the Ruby file you just executed:"
puts
File.open($0, "r") do |file|
  file.each do |line|
    puts line
  end
end
