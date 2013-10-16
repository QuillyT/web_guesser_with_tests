require 'sinatra/base'

module WebGuesser2
  class Server < Sinatra::Base
    get('/') do
      erb :index, :locals => {:last_guess => params[:guess]}
    end
  end
end
