require 'sinatra/base'
require_relative './lib/peeps'
require './database_connection_setup'

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

  get '/:id/edit' do
    p params
    @peep_id = params[:id]
    erb :edit
  end

  patch '/:id' do
    Peeps.update(id: params[:id], name: params[:name], username: params[:username], peep: params[:peep])
   
    redirect '/'
  end

  get '/users/new' do
    erb :users_new
  end

  post '/users' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end
  
  run! if app_file == $0
  end
