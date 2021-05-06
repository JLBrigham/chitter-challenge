require 'sinatra/base'
require_relative './lib/peeps'

class ChitterChallenge < Sinatra::Base

  
    get '/' do
      @peeps = Peeps.all
      erb :index
      
    end


    post '/peeps/new' do
        p params
        Peeps.create(name: params[:name], username: params[:username], peep: params[:peep])
        redirect '/'
    end

   

    
  
    run! if app_file == $0
  end