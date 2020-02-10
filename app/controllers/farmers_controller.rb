class FarmersController < ApplicationController

  # GET: /farmers
  get "/farmers" do
    if logged_in?
      @farmer = current_farmer
      @farmers = Farmer.all
      erb :"/farmers/index"
    else
      redirect "/farmers/login"
    end
  end

  # GET: /farmers/new
  get "/farmers/new" do
    if logged_in?
      redirect "/farmers"
    else
      erb :"/farmers/new"
    end
  end

  # POST: /farmers
  post "/farmers" do
    if params[:username].strip.empty? || params[:password].strip.empty?
      redirect "/farmers/new"
    else
      @farmer = Farmer.create(params)
      session[:farmer_id] = @farmer.id
      redirect "/farmers"
    end
  end

  # GET: /farmers/login
  get "/farmers/login" do
    if logged_in?
      redirect "/farmers"
    else
      erb :"/farmers/login"
    end
  end

  # POST: /farmers/login
  post "/farmers/login" do
    @farmer = Farmer.find_by(:username => params[:username])
    if @farmer && @farmer.authenticate(params[:password])
      session[:farmer_id] = @farmer.id
      redirect "/farmers"
    else
      redirect "/login"
    end
  end

  # GET: /farmers/5
  get "/farmers/:slug" do
    @farmer = Farmer.find_by_slug(params[:slug])
    erb :"/farmers/show"
  end

  # GET: /farmers/5/edit
  get "/farmers/:slug/edit" do
    if logged_in?
      @farmer = Farmer.find_by_slug(params[:slug])
      if @farmer.id == session[:farmer_id]
        erb :"/farmers/edit"
      else
        redirect "/farmers"
      end
    else
      redirect "/farmers/login"
    end
  end

  # PATCH: /farmers/5
  patch "/farmers/:slug" do
    redirect "/farmers/:slug"
  end

  # DELETE: /farmers/5/delete
  delete "/farmers/:slug" do
    redirect "/"
  end

  get "/farmers/logout" do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/farmers"
    end
  end
end
