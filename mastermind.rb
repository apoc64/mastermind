# Mastermind
# TDD, GIT...???
require './game'

#loop?
puts "Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?" #ask about difficulty
user_choice = gets.chomp
if user_choice == "p"
  puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game./n" #code to set based on difficulty

  game = Game.new(4, ["R", "G", "B", "Y"])
elsif user_choice == "i"
  puts "Just play"
end
