gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/web_guesser_2/guess_engine'

class GuessEngineTest < Minitest::Test
  def test_it_checks_a_guess_that_is_too_high
    ge = WebGuesser2::GuessEngine.new
    ge.set_secret(10)
    assert_equal :too_high, ge.check("30")
  end

  def test_it_checks_a_guess_that_is_too_low
    ge = WebGuesser2::GuessEngine.new
    ge.set_secret(10)
    assert_equal :too_low, ge.check("5")
  end
end
