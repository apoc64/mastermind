# Mastermind Runner File
require_relative './game'
# require 'pry'??? Why won't this work?

def user_loop(game)
  loop do
    user_guess = gets.chomp.upcase
    if user_guess == "Q" #case/when/then instead of if?
      break
    elsif user_guess == "C"
      puts game.answer
    elsif user_guess.length < game.length
      puts "Too short.\nGuess again. "
    elsif user_guess.length > game.length
      print "Too long.\nGuess again. "
    elsif user_guess == game.answer
      game.you_win
      break
    else
      game.evaluate_guess(user_guess)
    end #if user_guess
  end #loop do
end #user_loop

def choose_difficulty
  # When the user is getting ready to start a game, ask them what difficulty level they’d like to play with the following adaptations:
  #
  # Beginner = 4 characters, 4 colors
  # Intermediate = 6 characters, 5 colors
  # Advanced = 8 characters, 6 colors
  puts "Please choose your difficulty:\n  (b)eginner: 4 elements, 4 colors.\n  (i)ntermediate: 6 elements, 5 colors\n  (a)dvanced = 8 elements, 6 colors"
  # loop do
    print "What is your choice? "
    user_choice = gets.chomp.upcase
    if user_choice == "B"
      beginner_game
    elsif user_choice == "I"
      intermediate_game
    elsif user_choice == "A"
      advanced_game
    else
      puts "Invalid selection. Please choose again."
      choose_difficulty
    end
  # end

end

def beginner_game
  puts "\nI have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\n" #code to set
  game = Game.new(4, ["R", "G", "B", "Y"])
end

def intermediate_game
  puts "\nI have generated a beginner sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range. Use (q)uit at any time to end the game.\n\n"
  game = Game.new(6, ["R", "G", "B", "Y", "O"])
end

def advanced_game
  puts "\nI have generated an advanced sequence with eight elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, and (p)urple. Use (q)uit at any time to end the game.\n\n"
  game = Game.new(8, ["R", "G", "B", "Y", "O", "P"])
end

def play_game #merge w/choose_difficulty
  game = choose_difficulty
  #choose difficulty
  # puts "\nI have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\n" #code to set based on difficulty
  # game = Game.new(4, ["R", "G", "B", "Y"])
  user_loop(game)
  #new game
end

# Start of game - First line of code:
puts "\n   ***** Welcome to MASTERMIND *****\n"

user_choice = ""
while user_choice != "q" do
  puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  user_choice = gets.chomp.downcase
  if user_choice == "p"
    play_game
  elsif user_choice == "i"
    puts "\nThis is a game where you have to guess the right colors in the right order. Try to get the answer quickly, and with as few guesses as possible."
  end
end
