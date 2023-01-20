def prompt(message)
  Kernel.puts("=> #{message}")
end 

def valid_name?(name)
  !name.empty? && name.is_a?(String)
end 

def integer?(number)
  number.to_i.to_s == number
end 

def float?(input)
  input.to_f.to_s == input
end 

def number?(input)
  integer?(input) || float?(input)
end 

monthly_payment = nil
loan_amt = nil
interest_rate = nil
loan_duration = nil 
name = nil 

prompt("Hi, welcome to the Mortgage/Car Loan calculator")
prompt("Please enter your name to begin")
  loop do 
    name = Kernel.gets().chomp()
    if valid_name?(name)
      prompt("Welcome #{name}!")
      break
    else 
      prompt("Please enter a valid name")
    end 
  end 
  
loop do 
  
  
  loop do 
    prompt("Please enter the loan amount:")
    loan_amt = Kernel.gets().chomp()
    if number?(loan_amt)
       break
    else 
      prompt("Please enter a valid number")
    end 
  end 
  
  loop do 
    prompt("Please enter your interest rate:")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    interest_rate = Kernel.gets().chomp()
    if number?(interest_rate)
       break 
    else 
      prompt("Please enter a valid number")
    end 
  end 
  
  loop do 
    prompt("Please enter your loan duration in months:")
    loan_duration = Kernel.gets().chomp()
    if number?(loan_duration)
       break 
    else 
      prompt("Please enter a valid number")
    end 
  end 
  
    annual_interest_rate = interest_rate.to_f() / 100
    monthly_interest_rate = annual_interest_rate / 12
    months = loan_duration.to_i
    monthly_payment = loan_amt.to_f() * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months)))
    
  
  
  prompt("-----calculating your monthly payment Mr/Mrs. #{name}-----")
  
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")
  
  prompt("Would you like to do another calculation?")
  prompt("press Y to continue, or any other key to exit")
  
  answer = Kernel.gets().chomp()
  
  break unless answer.downcase().start_with?('y')
end 

prompt("Thank you for using the calculator!")

  
