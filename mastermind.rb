# Mastermind
# TDD, GIT...???
require './game'

puts "Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
user_choice = gets.chomp
if user_choice == "p"
  game = Game.new
elsif user_choice == "i"
  puts "Just play"
end
