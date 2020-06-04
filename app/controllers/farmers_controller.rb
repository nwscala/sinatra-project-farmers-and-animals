class FarmersController < ApplicationController

  # GET: /farmers
  get "/farmers" do
    if logged_in?
      FarmerAnimal.cleanup
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
      redirect "/farmers/login"
    end
  end

  get "/farmers/logout" do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/"
    end
  end

  # GET: /farmers/farmerbrown
  get "/farmers/:slug" do
    if logged_in?
      @farmer = Farmer.find_by_slug(params[:slug])
      erb :"/farmers/show"
    else
      redirect "/farmers/login"
    end
  end

  # GET: /farmers/farmerbrown/edit
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

  # PATCH: /farmers/farmerbrown
  patch "/farmers/:slug" do
    # binding.pry
    farmer_animals = params[:farmer_animals]
    if farmer_animals
      farmer_animals.each do |update_hash|
        farmer_animal_update = FarmerAnimal.find_by(id: update_hash[:id])
        farmer_animal_update.update(update_hash)
        if farmer_animal_update[:quantity] == 0 || farmer_animal_update[:quantity] == nil
          farmer_animal_update.destroy
        end
      end
    end
    
    new_animal_hash = params[:new_animal]
    if (new_animal_hash[:kind_of_animal].strip.empty? && !new_animal_hash[:quantity].strip.empty?) || (new_animal_hash[:quantity].strip.empty? && !new_animal_hash[:kind_of_animal].strip.empty?)
      redirect "/farmers/#{params[:slug]}/edit"
    elsif new_animal_hash[:quantity] == 0 && new_animal_hash[:quantity] != nil
      redirect "/farmers/#{params[:slug]}/edit"
    else
      unless new_animal_hash[:kind_of_animal].strip.empty? && new_animal_hash[:quantity].strip.empty?
        clean_kind_of_animal = new_animal_hash[:kind_of_animal].strip.capitalize
        new_animal = Animal.find_or_create_by(:kind_of_animal => clean_kind_of_animal)
        new_farmer_animal = current_farmer.farmer_animals.find_or_create_by(:animal_id => new_animal.id)
        new_farmer_animal.quantity = new_animal_hash[:quantity]
        new_farmer_animal.save
      end
    end

    redirect "/farmers/#{params[:slug]}"
  end

  # DELETE: /farmers/5/delete
  delete "/farmers/:slug" do
    delete_farmer = current_farmer
    if logged_in?
      if delete_farmer.id == session[:farmer_id]
        delete_farmer.destroy
        session.clear
        redirect "/"
      else
        redirect "/farmers/#{params[:slug]}"
      end
    else
      redirect "/farmers/login"
    end
  end
end
