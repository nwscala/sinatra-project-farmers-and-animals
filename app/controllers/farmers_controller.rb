class FarmersController < ApplicationController

  # GET: /farmers
  get "/farmers" do
    erb :"/farmers/index.html"
  end

  # GET: /farmers/new
  get "/farmers/new" do
    erb :"/farmers/new.html"
  end

  # POST: /farmers
  post "/farmers" do
    redirect "/farmers"
  end

  # GET: /farmers/5
  get "/farmers/:id" do
    erb :"/farmers/show.html"
  end

  # GET: /farmers/5/edit
  get "/farmers/:id/edit" do
    erb :"/farmers/edit.html"
  end

  # PATCH: /farmers/5
  patch "/farmers/:id" do
    redirect "/farmers/:id"
  end

  # DELETE: /farmers/5/delete
  delete "/farmers/:id/delete" do
    redirect "/farmers"
  end
end
