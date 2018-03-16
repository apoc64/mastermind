require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < MiniTest::Test

  def setup
    @game = Game.new(4, ["R", "G", "B", "Y"])
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_generate_answer
    assert_equal 4, @game.answer.length
    new_answer = @game.generate_answer(7, ["r"])
    assert_equal 7, new_answer.length
  end

  def test_evaluate_elements
    assert_equal 0, @game.evaluate_elements("WWWW")
    refute @game.evaluate_elements(@game.answer) == 0
  end

  def test_evaluate_positions
    assert_equal 0, @game.evaluate_positions("WWWW")
    assert_equal 4, @game.evaluate_positions(@game.answer)
  end

end
