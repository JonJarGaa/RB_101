# ask user for two numbers
# ask user for operation to perform
# perform operation 
# output results


puts "Welcome to your personal Calcubot"

puts "What is your first number?"
num1 = gets.chomp

puts "What is your second number?"
num2 = gets.chomp

puts "What operation would you like me to perform on these two numbers?
      1) ADD
      2) SUBTRACT
      3) MULTIPLY
      4) DIVIDE "
op = gets.chomp


if op == "1"
  result = num1.to_i + num2.to_i
elsif op == "2"
  result = num1.to_i - num2.to_i
elsif op == "3"
  result = num1.to_i * num2.to_i
else
  result = num1.to_f /  num2.to_f
end

puts "The result is #{result}!"