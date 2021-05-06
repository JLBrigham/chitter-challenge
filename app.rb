require 'sinatra/base'
require_relative './lib/peeps'

class ChitterChallenge < Sinatra::Base
enable :sessions, :method_override
  
    get '/' do
      @peeps = Peeps.all.reverse
      erb :index
      
    end


    post '/peeps/new' do
        p params
        Peeps.create(name: params[:name], username: params[:username], peep: params[:peep])
        redirect '/'
    end

   delete '/:id' do
    p params
    connection = PG.connect(dbname: 'new_chitter_test')
    connection.exec("DELETE FROM peeps WHERE id = #{params['id']}")
    redirect '/'
   end

    
  
    run! if app_file == $0
  end