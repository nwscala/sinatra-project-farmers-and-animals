class AnimalsController < ApplicationController

  # GET: /animals
  get "/animals" do
    if logged_in?
      FarmerAnimal.cleanup
      Animal.cleanup
      @animals = Animal.all.sort_by{|animal| animal.kind_of_animal}
      erb :"/animals/index"
    else
      redirect "/farmers/login"
    end
  end

  # GET: /animals/5
  get "/animals/:slug" do
    if logged_in?
      @animal = Animal.find_by_slug(params[:slug])
      erb :"/animals/show"
    else
      redirect "/farmers/login"
    end
  end
end
