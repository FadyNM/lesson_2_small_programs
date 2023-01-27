# Created a hash to store which object beats which, along with abbreviation
# so the object, the short form & which objects are beaten by the chosen choice
# of the player or the computer can be accessed within one data structure.
MOVES_AND_CHOICES = {
  'rock' => { short_form: 'r', beats: ['scissors', 'lizard'] },
  'paper' => { short_form: 'p', beats: ['spock', 'rock'] },
  'lizard' => { short_form: 'l', beats: ['spock', 'paper'] },
  'scissors' => { short_form: 'sc', beats: ['paper', 'lizard'] },
  'spock' => { short_form: 'sp', beats: ['scissors', 'rock'] }
}

NUMBER_TO_WIN = 3

# This function is used to store the abbreviation of the words
# from the MOVES_AND_CHOICES hash, so it could later be referenced to
# from the user input
def short_form_value(*)
  MOVES_AND_CHOICES.values.map do |val|
    val[:short_form]
  end
end

# This function tells us which abbreviation belongs to which word
def display_rules(rules)
  rules.each do |key, val|
    prompt("Please choose '#{val[:short_form]}' for #{key.capitalize}")
  end
end

# This function allows us to re-assign the abbreviated user input
# so we can use it to refer back to the complete word
# for example: when user types 'p', the user input will be assigned
# to the key 'paper' from the MOVES_AND_CHOICES hash.
def re_assigning(choice)
  case choice
  when 'r' then choice = MOVES_AND_CHOICES.keys[0]
  when 'p' then choice = MOVES_AND_CHOICES.keys[1]
  when 'sc' then choice = MOVES_AND_CHOICES.keys[3]
  when 'sp' then choice = MOVES_AND_CHOICES.keys[4]
  when 'l' then choice = MOVES_AND_CHOICES.keys[2]
  # Updating the code so user input can be
  # short form or the full word.
  when 'rock' then choice = MOVES_AND_CHOICES.keys[0]
  when 'paper' then choice = MOVES_AND_CHOICES.keys[1]
  when 'scissors' then choice = MOVES_AND_CHOICES.keys[3]
  when 'spock' then choice = MOVES_AND_CHOICES.keys[4]
  when 'lizard' then choice = MOVES_AND_CHOICES.keys[2]
  end
end

# This function displays the rules of the game.
# It tells the user which object beats which ones
# so it makes it easier for them to choose.
# That is done through iterating the MOVES_AND_CHOICES hash,
# displaying the key (object) along with displaying the values
#  (other objects) it beats in the game.
def display_winning_condition(condition)
  condition.each do |key, val|
    prompt("#{key.capitalize} beats #{val[:beats][0].capitalize}
    and #{val[:beats][1].capitalize}.")
  end
end

# We use this function to check if the return value of computer_choice.sample
# is included in the array of [:beats] which is referred to by the user_answer
# Example: if user_answer = 'p', then 'p' gets re-assigned to 'paper'
# (user_answer = 'p' becomes user_answer = MOVES_AND_CHOICES.keys[1]) because of
#  the re_assigning method. And then we check using [:beats]
# because the user_answer now refers to the key 'paper',
# and we can see if the return value
# of computer_answer is inlcuded in that array.
def win?(user_answer, computer_answer)
  MOVES_AND_CHOICES[user_answer][:beats].include?(computer_answer)
end

# We use this function to display who won after both choices are picked
# And it also displays the objects chosen by the user and the computer
# The 'win?' function is used in this function to check if it's true or false
# if true; the (return value of computer_choice) is included
# in MOVES_AND_CHOICES[user_choice][:beats]
# array and the user wins, and vice versa. Or else a tie if both chose same.
def display_results?(user, computer)
  prompt("You chose #{user.capitalize}, computer chose #{computer.capitalize}")

  if win?(user, computer)
    prompt("Victory is yours! #{user.capitalize} beats #{computer.capitalize}")
 
  elsif win?(computer, user)
    prompt("Uh-oh. The computer won! #{computer.capitalize} beats #{user.capitalize}")

  else
    prompt("Great minds think alike! You both chose #{user.capitalize}. It's a tie!")
  end
end

# We use the 'score_keep_hash' hash to update the score after every go
# similar to 'display_results?' function, we use the 'win?' function to see 
# who wins.
# If user wins, 1 point to user. If computer wins 1 point to computer.
# If its a tie no points given.
def score_update(user, computer, score_keep)
  if win?(user, computer)
    score_keep[:player] += 1

  elsif win?(computer, user)
    score_keep[:computer] += 1
  end
end

# We use the 'score_keep_hash' hash to reset the score after 3 rounds
# the integer 0 is assigned both keys in the hash
def score_reset(score_hash)
  score_hash[:player] = 0 && score_hash[:computer] = 0
end

# This function simply displays the score.
def display_score(score_keep)
  prompt("Player score: #{score_keep[:player]}, Computer score: #{score_keep[:computer]}")
end

def prompt(message)
  puts "=:> #{message}"
end

# This function helps us display the message and announce who won after 3 rounds.
# It's like hitting two birds with one stone,
# because our 'display_score' method and this method
# uses the same hash (score_keep_hash) to refernce to.
# This function uses the hash to access the values to be used as conditionals.
def won_round_of_three(score_hash)
  if score_hash[:player] == NUMBER_TO_WIN
    prompt("Bingo! You won all 3 rounds!")

  elsif score_hash[:computer] == NUMBER_TO_WIN
    prompt("Defeated by Technology! Computer won!")
  end

  display_score(score_hash)
end

def play_again?
  prompt("Would you like to play again? Y for yes, any other key to exit.")
end

# Asks the user if they want to see the rules of the game, using out
# display_winning_condition method.
def want_to_see_rules?(yes_or_no)
  prompt("Would you like to see the rules? Y/N")

  yes_or_no = gets.chomp.downcase

  if yes_or_no == 'y'
    display_winning_condition(MOVES_AND_CHOICES)
    empty_line

  else
    empty_line
  end
end

def loading_game
  prompt("--------------Loading the game--------------")
end

def empty_line
  puts " "
end

# We use this variable later in the loop that makes sure the user input
# matches the words needed for the program to compare the user input and
# the computer input.
valid_choice = MOVES_AND_CHOICES.keys + short_form_value

user_choice = nil
ans = nil
answer = nil

# This hash allows us to update the score after each round,
# and reset after 3 rounds after determining who won using the
# different functions.
score_keep_hash = { player: 0, computer: 0 }

# The game begins here
prompt("Welcome to the Rock Paper Scissors Lizard Spock game!")

# The parent loop
loop do
  empty_line

  # Asks the user if they want to see the winning conditions.
  want_to_see_rules?(answer)

  loading_game

  loop do
    empty_line
    display_score(score_keep_hash)
    empty_line
    display_rules(MOVES_AND_CHOICES)
    empty_line

    loop do
      prompt("Please enter your choice:")
      choice = gets.chomp.downcase
      user_choice = re_assigning(choice)

      if !valid_choice.include?(choice)
        prompt("Invalid. Please try again.")
      else
        break
      end
    end

    empty_line
    computer_choice = MOVES_AND_CHOICES.keys.sample
    score_update(user_choice, computer_choice, score_keep_hash)
    display_results?(user_choice, computer_choice)
    empty_line

    # We use the condition here that if either the user or computer gets to 3 wins
    # The loop will break
    break if score_keep_hash[:player] == NUMBER_TO_WIN || score_keep_hash[:computer] == NUMBER_TO_WIN
  end

  # Displays who won the round (after 3 gos)
  won_round_of_three(score_keep_hash)
  empty_line

  # Asks the user if they want to play again.
  play_again?
  ans = gets.chomp.downcase
  break if ans != 'y'

  # This is where the 'score_reset' function comes in handy.
  # It reassigns the user and computer score to 0 so we can start over
  score_reset(score_keep_hash)
end

prompt("Thank you for playing the game. We'll be back with more fun games!")
