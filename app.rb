require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChallenge < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end
  
    get '/' do
      erb :index
    end


    post '/peeps/new' do
        p params
        Peeps.create(name: params[:name], username: params[:username], peep: params[:peep])
        redirect '/'
    end

   

    
  
    run! if app_file == $0
  end