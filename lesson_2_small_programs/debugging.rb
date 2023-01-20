=begin 
def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end 

def make(new_car)
  new_car.split(" ")[0]
end 

def model(new_car)
  new_car.split(" ")[1]
end 

make, model = car("Ford Mustang")
puts make == "Ford"
puts model.start_with?("M") 
=end


require "pry"

counter = 0 
loop do 
  counter += 1
  binding.pry
  break if counter == 5
end 

