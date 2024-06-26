# leap_year_checker.rb

def is_leap_year(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

puts "Enter a year:"
year = gets.chomp.to_i

if is_leap_year(year)
  puts "#{year} is a leap year."
else
  puts "#{year} is not a leap year."
end