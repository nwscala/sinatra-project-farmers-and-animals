class AnimalsController < ApplicationController

  # GET: /animals
  get "/animals" do
    erb :"/animals/index"
  end

  # GET: /animals/new
  get "/animals/new" do
    erb :"/animals/new"
  end

  # POST: /animals
  post "/animals" do
    redirect "/animals"
  end

  # GET: /animals/5
  get "/animals/:id" do
    erb :"/animals/show"
  end

  # GET: /animals/5/edit
  get "/animals/:id/edit" do
    erb :"/animals/edit"
  end

  # PATCH: /animals/5
  patch "/animals/:id" do
    redirect "/animals/:id"
  end

  # DELETE: /animals/5/delete
  delete "/animals/:id/delete" do
    redirect "/animals"
  end
end
