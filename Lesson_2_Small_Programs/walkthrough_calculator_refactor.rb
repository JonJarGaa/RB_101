# ask user for two numbers
#  validates numbers
#   if invalid G
# ask user for operation to perform
# perform operation 
# output results

def say(message)    #  Adds ad Rocket to Computer to user messages and avoids redundant puts. 
  puts "=> #{message}"
end

def valid_num?(num)   # Basic check for a valid number with many edge cases. "num.to_i.to_s" is much better
  num.to_i != 0
end

def op_to_ing(op)  # Adds custom "ing" word to message saying what operation is being run before answer is printed
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

say("Welcome to your personal Calculon.          
      I will do simple math operations for you"
)

name = ''
loop do                           # Name validation loop
  say("What is your name?")
  name = gets.chomp

  if name.empty?
    say("No name entered, Please Enter a name to continue with Calculon")
  else
    break
  end
end

say("Hello #{name}!")


loop do                           # MAIN LOOP
  num1 = ''
  loop do
    say("What is your first number?")
    num1 = gets.chomp

    if valid_num?(num1)
      break
    else
      say("Not a valid number. Please input a valid number.")
    end
  end

  num2 = ''
  loop do
    say("What is your second number?")
    num2 = gets.chomp

    if valid_num?(num2)
      break
    else
      say("Not a valid number. Please input a valid number.")
    end
  end

  heredoc_op_req = <<-MSG 
  What operation would you like me to perform on these two numbers?
        1) ADD
        2) SUBTRACT
        3) MULTIPLY
        4) DIVIDE
  MSG

  say(heredoc_op_req)

  op = ''
  loop do
    op = gets.chomp
    if %w(1 2 3 4).include?(op)
      break
    else
      say("Please enter only 1, 2, 3 or 4! TRY AGAIN:")
    end
  end

  result = case op
            when "1"
              num1.to_i + num2.to_i
            when "2"
              num1.to_i - num2.to_i
            when "3"
              num1.to_i * num2.to_i
            when "4"
              num1.to_f /  num2.to_f
  end


  say("#{op_to_ing(op)} your numbers.....")
  say("The result is #{result}!")

  say("Shall I perform another operation? Type: 'Y'")
  again = gets.chomp
  
  break unless again.downcase.start_with?('y')
end

say("Thank you for running my Program today. Please run me again for more math!")