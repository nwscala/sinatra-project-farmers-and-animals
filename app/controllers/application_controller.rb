require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
  end

  get "/" do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:farmer_id]
    end

    def current_farmer
      Farmer.find_by(id: session[:farmer_id])
    end
  end
end
