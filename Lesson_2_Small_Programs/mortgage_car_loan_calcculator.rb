=begin
PEDAC Template
==============

(Understand the) Problem

------------------------
First, identify the inputs and the outputs of the problem.
-  Inputs: 
    loan_amt
    apr
    loan_duration  
-  Output:
    monthly_interest_rate
    loan_duration_months
    monthly_payment

---
**Problem Domain:**
  formula =   m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly_payment
    p = loan_amt
    j = monthly_interest_rate
    n = loan_duration_months

1) Figure out what format your inputs need to be in. For example, should the 
interest rate be expressed as 5 or .05, if you mean 5% interest?

2) If you're working with Annual Percentage Rate (APR), you'll need to convert 
that to a monthly interest rate.

3) Be careful about the loan duration -- are you working with months or years? 
Choose variable names carefully to assist in remembering. 
---

Check for Implicit Requirements. Are there requirements that are not explicitly
stated?
**Implicit Requirements:**
- convert apr into monthly interest rate

---

Some questions to ask the interviewer (or perhaps yourself) to better understand
the problem.
**Clarifying Questions:**
1.
2.
3.

---


**Mental Model:**

Get user input for: 
  Loan Amount, 
  APR  
  Duration

Give the user Output for:
  monthly_interest_rate
  loan_duration_months
  monthly_payment


---

Examples / Test Cases / Edge Cases

----------------------------------

The objective is to come up with examples that validate your understanding of
the problem, and confirm that you are working in the right direction. Typically
the confirmation will come from documentation of a process, or a person.
**Examples:**
-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

---

**Test Cases:**
*Note: Rules for a specific problem are oftentimes an excellent place to find
test cases. If you're working with collections, it's a good idea to find test
cases that deal with zero, one or multiple elements in the collection. Try to
provide test cases that handle any edge cases you can find.*
Find test cases with the following conditions:
-  Zero (`0`)
-  Emptiness (`nil`, `null`, `""`, `[]`, `{}`)
-  Boundary conditions (where conditions change)
-  Repetition / duplication
-  Upper case / lower case
-  Data types
As well as the following failurs and bad inputs:
-  Raise exceptions / report errors
-  Special values (`nil`, `0`, `""`, surrogate pairs, char. encoding, special
   char.)
_Your Test Cases:_
-  Example 3
  -  Inputs:
  -  Output:

---

**Edge Cases:**

Edge cases are situations that occur along the "edge" of a specific problem.
For example: problems that involve iterating over numbers have edge cases that
are at both ends of the range. Typically can involve working with negative
numbers, 0, or extremely high values.

_Your Edge Cases:_
-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure

--------------

Determine what data structures you will work with to convert the input to the
desired output.
The chief considerations here are your intended programming language and your
mental model.
Are you going to use arrays, hashes, etc? Your data structure will influence
your program.

---

Algorithm
---------
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



----  Calculate the monthly interest rate, how many months the loan is and 
how much each month's payment is

Give the user Output for:
  monthly_interest_rate
  loan_duration_months
  monthly_payment


---

Examples / Test Cases / Edge Cases

----------------------------------

The objective is to come up with examples that validate your understanding of
the problem, and confirm that you are working in the right direction. Typically
the confirmation will come from documentation of a process, or a person.
**Examples:**
-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:

---

**Test Cases:**
*Note: Rules for a specific problem are oftentimes an excellent place to find
test cases. If you're working with collections, it's a good idea to find test
cases that deal with zero, one or multiple elements in the collection. Try to
provide test cases that handle any edge cases you can find.*
Find test cases with the following conditions:
-  Zero (`0`)
-  Emptiness (`nil`, `null`, `""`, `[]`, `{}`)
-  Boundary conditions (where conditions change)
-  Repetition / duplication
-  Upper case / lower case
-  Data types
As well as the following failurs and bad inputs:
-  Raise exceptions / report errors
-  Special values (`nil`, `0`, `""`, surrogate pairs, char. encoding, special
   char.)
_Your Test Cases:_
-  Example 3
  -  Inputs:
  -  Output:

---

**Edge Cases:**

Edge cases are situations that occur along the "edge" of a specific problem.
For example: problems that involve iterating over numbers have edge cases that
are at both ends of the range. Typically can involve working with negative
numbers, 0, or extremely high values.

_Your Edge Cases:_
-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure

--------------

Determine what data structures you will work with to convert the input to the
desired output.
The chief considerations here are your intended programming language and your
mental model.
Are you going to use arrays, hashes, etc? Your data structure will influence
your program.

---

Algorithm
---------
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


----

=end

def say(message)
  puts "==> #{message}"
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
  
  if loan_amt.empty? || num?(loan_amt) == false
    say("ERROR: Please input a valid Loan Amount!")
  else
    loan_amt = loan_amt.to_i
    break
  end
end

apr = ''
monthly_interest_rate = '' # monthly rate is in decimal form ready to multiply in formula
loop do
  say("Enter Annual Percenage rate (i.e. 5.5 for 5.5%)")
  apr = gets.chomp
  if num?(apr) && apr.to_f >= 1
    monthly_interest_rate = apr.to_f / 12 * 0.01
    break
  elsif apr.to_f <= 0.9999
    monthly_interest_rate = apr.to_f
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

say("Your $#{loan_amt} loan's monthly interest rate is #{monthly_interest_rate * 100}% and will be paid off in #{loan_duration_months} months of $#{monthly_pmt} per month!")
