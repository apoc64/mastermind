#Class for Mastermind game
class Game

  def initialize(length, colors)
    @length = length
    @answer = generate_answer(length, colors) #can take different
    @number_of_guesses = 0
    @start_time = Time.new
    # puts @answer

    puts "What's your guess?"
    user_loop
  end #initialize

  def generate_answer(length, char_set) #class?
    Array.new(length).map do
      char_set.sample
    end.join
  end #generate answer

  def user_loop
    loop do
      user_guess = gets.chomp.upcase
      if user_guess == "Q" #case when then 
        break
      elsif user_guess == "C"
        puts @answer
      elsif user_guess.length < 4
        puts "Too short. Guess again."
      elsif user_guess.length > 4
        puts "Too long. Guess again."
      elsif user_guess == @answer
        you_win
        break
      else
        evaluate_guess(user_guess)
      end #if user_guess
    end #loop do
  end #user_loop

  def you_win
    game_time = (Time.new - @start_time).to_i #minutes - /60 %60?
    minutes = game_time/60
    seconds = game_time%60
    puts "Congratulations! You guessed the sequence '#{@answer}' in #{@number_of_guesses} guesses over #{minutes} minutes, #{seconds} seconds"
    puts "Do you want to (p)lay again or (q)uit?"
    if gets.chomp == "p"
      game = Game.new(4, ["R", "G", "B", "Y"]) #go to Mastermind class???
    end
  end #you_win

  def evaluate_guess(guess)
    elements = evaluate_elements(guess)
    positions = evaluate_positions(guess)
    puts "'#{guess}' has #{elements} of the correct elements with #{positions} in the correct positions."
    puts "Guess again."
    @number_of_guesses += 1
  end #evaluate_guess

  def evaluate_elements(guess)
    elements = 0
    correct_elements = "" #avoid duplication
    @length.times do |index|
      guess_char = guess.upcase[index]
      if @answer.include?(guess_char) && !correct_elements.include?(guess_char)
        elements += 1
        correct_elements += guess_char
      end # a.include
    end
    elements
  end

  def evaluate_positions(guess)
    positions = 0
    @length.times do |index|
      if @answer[index] == guess.upcase[index]
        positions += 1
      end #if a = g
    end
    positions
  end

end #Game class
