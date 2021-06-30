def say(message)
  puts "=> #{message}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def num?(num)
  float?(num) || integer?(num)
end

say("Welcome to your loan calculator!")

loan_amt = ''
loop do
  say("What is your total Loan Amount (no dollar signs!)?")
  loan_amt = gets.chomp

  if loan_amt.empty? || num?(loan_amt) == false || loan_amt.to_i <= 0
    say("ERROR: Please input a valid Loan Amount!")
  else
    loan_amt = loan_amt.to_i
    break
  end
end

apr = ''
monthly_interest_rate = '' # monthly % is in decimal form
loop do
  say("Enter Annual Percenage rate (i.e. 5.5 for 5.5%)")
  apr = gets.chomp

  if num?(apr) && apr.to_f >= 1 && apr.to_f > 0
    monthly_interest_rate = apr.to_f / 12 * 0.01
    break

  elsif apr.to_f <= 0.9999 && apr.to_f > 0
    monthly_interest_rate = apr.to_f / 12
    break

  else
    say("ERROR: Please enter a valid Loan percentage!")
  end
end

loan_duration_months = ''
loop do
  say("How long (in years) is your loan duration?")
  loan_duration = gets.chomp

  if loan_duration.empty? || num?(loan_duration) == false
    say("ERROR: Please enter a valid Loan percentage!")

  else
    loan_duration_months = loan_duration.to_i * 12
    break
  end
end

monthly_pmt = loan_amt * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

result_msg = <<-MSG
Your $#{loan_amt} loan's monthly interest rate is #{monthly_interest_rate * 100}%
and will be paid off in #{loan_duration_months} months of $#{monthly_pmt.floor(2)} per month!
MSG

say(result_msg)

=begin

***PSEUDOCODE***

START

GET "Enter Loan Amount in whole dollars"
SET loan_amt

GET "Enter Annual Percenage rate (i.e. 5.5 for 5.5%)"
SET apr = rate * .01
SET monthly_interest_rate = apr /12

GET "Enter Loan Duration in Years"
SET monthly_interest_rate = years x 12

monthly_payment = subprocess

PRINT monthly_interest_rate
PRINT loan_duration_months
PRINT monthly_payment

END

=end
