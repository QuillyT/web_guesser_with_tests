gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require './lib/web_guesser_2/server'

class WebGuesserTest < Minitest::Test
  include Rack::Test::Methods

  def app
    WebGuesser2::Server
  end

  def test_it_exists
    assert WebGuesser2::Server
  end

  def test_it_displays_the_secret
    get '/'
    assert (last_response.body =~ /The secret number is \d+/)
  end

  def test_it_accepts_a_guess
    get '/', :guess => 10
    assert (last_response.body =~ /You guessed 10/)
  end

  def test_it_gives_feedback_on_a_low_guess
    get '/', {:guess => 5, :secret => 10}
    assert (last_response.body =~ /Sorry, that's too low./)
    refute (last_response.body =~ /Sorry, that's too high./)
  end

  def test_it_gives_feedback_on_a_high_guess
    get '/', :guess => 20, :secret => 10
    assert (last_response.body =~ /Sorry, that's too high./)
    refute (last_response.body =~ /Sorry, that's too low./)
  end
end
