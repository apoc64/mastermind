# Mastermind
# TDD, GIT...???
require './game'
# require 'pry'

def user_loop(game)
  loop do
    user_guess = gets.chomp.upcase
    if user_guess == "Q" #case when then
      break
    elsif user_guess == "C"
      puts game.answer
    elsif user_guess.length < game.length
      puts "Too short. Guess again."
    elsif user_guess.length > game.length
      puts "Too long. Guess again."
    elsif user_guess == game.answer
      game.you_win
      game_won
      break
    else
      game.evaluate_guess(user_guess)
    end #if user_guess
  end #loop do
end #user_loop

def game_won
  puts "\nDo you want to (p)lay again or (q)uit?"
  if gets.chomp == "p"
    game = Game.new(4, ["R", "G", "B", "Y"])
    user_loop(game)
  end
end

# Start of game
puts "\n   *** Welcome to MASTERMIND ***\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?" #ask about difficulty
user_choice = gets.chomp

if user_choice == "p"
  puts "\nI have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\n" #code to set based on difficulty
  game = Game.new(4, ["R", "G", "B", "Y"])
  user_loop(game)
elsif user_choice == "i"
  puts "Just play"
end
