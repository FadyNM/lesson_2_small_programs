def prompt(message)
  Kernel.puts("=> #{message}")
end 

def integer?(input)
  input.to_i.to_s == input 
end 

def number?(input)
  integer?(input) || float?(input)
end 

def float?(input)
  input.to_f.to_s == input
end 

def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end 
  x = "Random line of code"
  
  word
end 


prompt("Welcome to Calculator! Enter your name:")

name = ''

loop do 
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else 
    break 
  end 
end 


number1 = nil # Have to move the variable outside the loop due to scoping rules
number2 = nil
loop do 
  
  loop do 
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    
    if number?(number1)
      break
    else 
      prompt("Hmmm... that doesn't look like a valid number")
    end 
  end 
  
  
  loop do 
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    
    if number?(number2)
      break 
    else 
      prompt("Hmmm... that doesn't look like a valid number")
    end 
  end 

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) addition
    2) subtraction
    3) multiplication
    4) division
  MSG
  
  prompt("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
  operator = nil
  
  loop do 
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else 
      prompt("Must choose only the options above")
    end 
  end 
  
  prompt("#{operation_to_message(operator)} the two numbers ...")
  
  #refactor the if statement to a case statement
  result = case operator
  
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f() #because we're doing float division, it will give an accurate answer instead of rounding
  end 
  
  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase() == 'y'
  
end   
 