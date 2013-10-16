require 'bundler'
Bundler.require

require 'sinatra'
require './lib/web_guesser_2/server'

run WebGuesser2::Server
