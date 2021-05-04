require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end
  
    get '/' do
      'Welcome to Chitter'
    end

    get '/peeps' do
        
    end

    get '/peeps/new' do
        erb :peeps_new 
    end

    
  
    run! if app_file == $0
  end