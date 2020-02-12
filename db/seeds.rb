# ruby code objects
# run with rake db:seed
# rake db:drop to clear database
# need to run rake db:migrate
farmerbrown = Farmer.create(:username => "farmerbrown", :password => "test")
cow = Animal.create(:kind_of_animal => "Cow")
farmerbrown.farmer_animals.create(:animal_id => cow.id, :quantity => 20)