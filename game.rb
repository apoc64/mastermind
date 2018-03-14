#Class for Mastermind game
class Game

  def initialize
    @answer = generate_answer
    @number_of_guesses = 0
    @start_time = Time.new
    puts @answer
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts "What's your guess?"
    user_loop
  end #initialize

  def generate_answer
    answer = ""
    4.times do
      char_generator = rand(4)
      if char_generator == 0
        answer += "R"
      elsif char_generator == 1
        answer += "G"
      elsif char_generator == 2
        answer += "B"
      elsif char_generator == 3
        answer += "Y"
      end #if char_generator
    end #4.times
    answer
  end #generate answer

  def user_loop
    loop do
      user_guess = gets.chomp
      if user_guess.upcase == "Q"
        break
      elsif user_guess.upcase == "C"
        puts @answer
      elsif user_guess.length < 4
        puts "Too short. Guess again."
      elsif user_guess.length > 4
        puts "Too long. Guess again."
      elsif user_guess.upcase == @answer
        you_win
        break
      else
        evaluate_guess(user_guess)
      end #if user_guess
    end #loop do
  end #user_loop

  def you_win
    game_time = Time.new - @start_time #minutes
    puts "Congratulations! You guessed the sequence '#{@answer}' in #{@number_of_guesses} guesses over #{game_time} seconds"
    #Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes, 22 seconds.
    puts "Do you want to (p)lay again or (q)uit?"
    if gets.chomp == "p"
      game = Game.new
    end
  end #you_win

  def evaluate_guess(guess)
    elements = 0
    positions = 0
    correct_elements = "" #avoid duplication
    4.times do |index|
      guess_char = guess.upcase[index]
      if @answer.include?(guess_char) && !correct_elements.include?(guess_char)
        elements += 1
        correct_elements += guess_char
      end # a.include
      if @answer[index] == guess.upcase[index]
        positions += 1
      end #if a = g
    end # 4 times
    puts "'#{guess}' has #{elements} of the correct elements with #{positions} in the correct positions."
    puts "Guess again."
    @number_of_guesses += 1
  end #evaluate_guess

end #Game class
