require 'sinatra'
require './lib/item'
require './lib/basket'

class Supermarket < Sinatra::Base

  get '/' do
    erb :index
  end

end