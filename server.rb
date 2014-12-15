require 'sinatra'
require './lib/item'
require './lib/basket'

class Supermarket < Sinatra::Base

  get '/' do
    @basket = Basket.new
    erb :index
  end

  post '/cart' do
    @basket = Basket.new
    erb :cart
  end

end