VALID_CHOICES = %w(rock paper scissors lizard spock)

VALID_CHOICE_HASH = { r: VALID_CHOICES[0], 
p: VALID_CHOICES[1], 
sc: VALID_CHOICES[2], 
l: VALID_CHOICES[3], 
sp: VALID_CHOICES[4]
}

VALID_CHOICE_HASH. each do |key, val|
  puts val 
end 