require 'sinatra/base'
require './lib/web_guesser_2/guess_engine'

module WebGuesser2
  class Server < Sinatra::Base
    def guess_engine
      @guess_engine ||= GuessEngine.new
    end

    get('/') do
      secret = guess_engine.set_secret(params[:secret])
      result = guess_engine.check(params[:guess])

      erb :index, 
          :locals => {:last_guess => params[:guess].to_i, 
                      :secret => secret,
                      :result => result}
    end
  end
end

