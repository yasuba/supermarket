require 'sinatra/base'

class Supermarket < Sinatra::Base
  get '/' do
    'Hello Supermarket!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
