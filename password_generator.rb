# random_password_generator.rb

def generate_password(length)
  chars = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
  password = ''
  length.times { password << chars.sample }
  password
end

puts "Enter the desired password length:"
length = gets.chomp.to_i
password = generate_password(length)

puts "Generated password: #{password}"