require 'sinatra/base'
require_relative './lib/peeps'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/user'

class ChitterChallenge < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  
  get '/' do
    @username = session[:username]
    @peeps = Peeps.all.reverse
    erb :index
    
  end

  post '/peeps/new' do
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
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/sessions/new' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])

    if user
      session[:username] = user.username
      session[:name] = user.name
      session[:id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your username or password'
      redirect('/sessions/new')
    end

    p params
    
  end

  get '/sessions/destroy' do
    session.clear
    flash[:notice] = "You are now logged out, goodbye!"
    redirect('/')
    p session[:name]
  end
   
  run! if app_file == $0
  end
