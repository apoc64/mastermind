#Class for Mastermind game
class Game
  attr_reader :answer,
              :length

  def initialize(length, colors)
    @length = length
    @answer = generate_answer(length, colors) #can take different
    @number_of_guesses = 0
    @start_time = Time.new
    # puts @answer
    puts "    What's your guess?"
  end #initialize

  def generate_answer(length, char_set)
    Array.new(length).map do
      char_set.sample
    end.join
  end #generate answer

  def you_win #how to test?
    game_time = (Time.new - @start_time).to_i
    minutes = game_time / 60
    seconds = game_time % 60
    puts "Congratulations! You guessed the sequence '#{@answer}' in #{@number_of_guesses} guesses over #{minutes} minutes, #{seconds} seconds"
  end #you_win

  def evaluate_guess(guess) #how to test?
    elements = evaluate_elements(guess)
    positions = evaluate_positions(guess)
    puts "'#{guess}' has #{elements} of the correct elements with #{positions} in the correct positions."
    puts "    Guess again."
    @number_of_guesses += 1
  end #evaluate_guess

  def evaluate_elements(guess)
    elements = 0
    correct_elements = "" #avoid duplication ?uniq
    @length.times do |index| #.split
      guess_char = guess[index]
      if @answer.include?(guess_char) && !correct_elements.include?(guess_char)
        elements += 1
        correct_elements << guess_char
      end # a.include
    end
    elements
  end

  def evaluate_positions(guess) #.zip?
    positions = 0
    @length.times do |index|
      if @answer[index] == guess[index]
        positions += 1
      end #if a = g
    end
    positions
  end

end #Game class
