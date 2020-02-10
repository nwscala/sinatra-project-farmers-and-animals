[1] pry(main)> brown
NameError: undefined local variable or method `brown' for main:Object
from (pry):1:in `__pry__'
[2] pry(main)> brown = Farmer.first
=> #<Farmer:0x00007fffde1cd9d8
 id: 1,
 username: "farmerbrown",
 password_digest: "$2a$12$4BMf0lfNQPi8MkB0HKwDXei83nwCv3O3ahjgbd5Mn0MWyFlwuxd6W",
 created_at: 2020-02-10 19:17:09 UTC,
 updated_at: 2020-02-10 19:17:09 UTC>
[3] pry(main)> goose = Animal.create(:kind_of_animal => "Goose")
=> #<Animal:0x00007fffde28ca90 id: 1, kind_of_animal: "Goose", created_at: 2020-02-10 19:20:01 UTC, updated_at: 2020-02-10 19:20:01 UTC>
[4] pry(main)> FarmerAnimal.create(:farmer_id => brown.id, :animal_id => goose.id, :quantity => 20)
=> #<FarmerAnimal:0x00007fffde4385b0
 id: 1,
 farmer_id: 1,
 animal_id: 1,
 quantity: 20,
 created_at: 2020-02-10 19:21:42 UTC,
 updated_at: 2020-02-10 19:21:42 UTC>
[5] pry(main)> brown.animals
=> [#<Animal:0x00007fffdd1df148 id: 1, kind_of_animal: "Goose", created_at: 2020-02-10 19:20:01 UTC, updated_at: 2020-02-10 19:20:01 UTC>]
[6] pry(main)> brown.farmeranimals
NoMethodError: undefined method `farmeranimals' for #<Farmer:0x00007fffde1cd9d8>
Did you mean?  farmer_animals
               farmer_animals=
               farmer_animal_ids
from /home/nwscala/.rvm/gems/ruby-2.6.1/gems/activemodel-4.2.11.1/lib/active_model/attribute_methods.rb:433:in `method_missing'
[7] pry(main)> brown.farmer_animals
=> [#<FarmerAnimal:0x00007fffdd9f96a8
  id: 1,
  farmer_id: 1,
  animal_id: 1,
  quantity: 20,
  created_at: 2020-02-10 19:21:42 UTC,
  updated_at: 2020-02-10 19:21:42 UTC>]
[8] pry(main)> brown.farmer_animals.first
=> #<FarmerAnimal:0x00007fffdd9f96a8
 id: 1,
 farmer_id: 1,
 animal_id: 1,
 quantity: 20,
 created_at: 2020-02-10 19:21:42 UTC,
 updated_at: 2020-02-10 19:21:42 UTC>
[9] pry(main)> brown.farmer_animals.first.quantity
=> 20
[10] pry(main)> brown.farmer_animals.first.animal
=> #<Animal:0x00007fffdda3f5e0 id: 1, kind_of_animal: "Goose", created_at: 2020-02-10 19:20:01 UTC, updated_at: 2020-02-10 19:20:01 UTC>
[11] pry(main)> brown.farmer_animals.first.animal.kind_of_animal
=> "Goose"
[12] pry(main)> brown.farmer_animals.first.animal.kind_of_animal.pluralize
=> "Gooses"
[13] pry(main)> horse = Animal.create(:kind_of_animal => "Horse")
=> #<Animal:0x00007fffde14e548 id: 2, kind_of_animal: "Horse", created_at: 2020-02-10 19:26:22 UTC, updated_at: 2020-02-10 19:26:22 UTC>
[14] pry(main)> cow = Animal.create(:kind_of_animal => "Cow")
=> #<Animal:0x00007fffde233530 id: 3, kind_of_animal: "Cow", created_at: 2020-02-10 19:26:31 UTC, updated_at: 2020-02-10 19:26:31 UTC>
[15] pry(main)> brown.farmer_animals.create(:animal_id => horse.id, :quantity => 5)
=> #<FarmerAnimal:0x00007fffde2db438
 id: 2,
 farmer_id: 1,
 animal_id: 2,
 quantity: 5,
 created_at: 2020-02-10 19:27:38 UTC,
 updated_at: 2020-02-10 19:27:38 UTC>
[16] pry(main)> brown.farmer_animals.create(:animal_id => cow.id, :quantity => 25)
=> #<FarmerAnimal:0x00007fffde41e980
 id: 3,
 farmer_id: 1,
 animal_id: 3,
 quantity: 25,
 created_at: 2020-02-10 19:27:51 UTC,
 updated_at: 2020-02-10 19:27:51 UTC>
[17] pry(main)> brown.farmer_animals.each do |farmer_animal|
[17] pry(main)*   puts "Kind of Animal: #{farmer_animal.animal.kind_of_animal}"
[17] pry(main)*   puts "Quantity of Animal: #{farmer_animal.quantity}"
[17] pry(main)* end  
Kind of Animal: Goose
Quantity of Animal: 20
Kind of Animal: Horse
Quantity of Animal: 5
Kind of Animal: Cow
Quantity of Animal: 25
=> [#<FarmerAnimal:0x00007fffdd9f96a8
  id: 1,
  farmer_id: 1,
  animal_id: 1,
  quantity: 20,
  created_at: 2020-02-10 19:21:42 UTC,
  updated_at: 2020-02-10 19:21:42 UTC>,
 #<FarmerAnimal:0x00007fffde2db438
  id: 2,
  farmer_id: 1,
  animal_id: 2,
  quantity: 5,
[18] pry(main)> params = {
[18] pry(main)*   kind_of_animal: "Dog",
[18] pry(main)*   quantity: 15
[18] pry(main)* }  
=> {:kind_of_animal=>"Dog", :quantity=>15}
[19] pry(main)> params[:kind_of_animal]
=> "Dog"
[20] pry(main)> params[:quantity]
=> 15
[21] pry(main)> current_user = User.first
NameError: uninitialized constant User
from (pry):27:in `__pry__'
[22] pry(main)> current_user = Farmer.first
=> #<Farmer:0x00007fffdeae8fe0
 id: 1,
 username: "farmerbrown",
 password_digest: "$2a$12$4BMf0lfNQPi8MkB0HKwDXei83nwCv3O3ahjgbd5Mn0MWyFlwuxd6W",
 created_at: 2020-02-10 19:17:09 UTC,
 updated_at: 2020-02-10 19:17:09 UTC>
[23] pry(main)> current_user
=> #<Farmer:0x00007fffdeae8fe0
 id: 1,
 username: "farmerbrown",
 password_digest: "$2a$12$4BMf0lfNQPi8MkB0HKwDXei83nwCv3O3ahjgbd5Mn0MWyFlwuxd6W",
 created_at: 2020-02-10 19:17:09 UTC,
 updated_at: 2020-02-10 19:17:09 UTC>
[24] pry(main)> params
=> {:kind_of_animal=>"Dog", :quantity=>15}
[25] pry(main)> animal = Animal_find_or_create_by(kind_of_animal: params[:kind_of_animal])
NoMethodError: undefined method `Animal_find_or_create_by' for main:Object
from (pry):31:in `__pry__'
[26] pry(main)> animal = Animal.find_or_create_by(kind_of_animal: params[:kind_of_animal])
=> #<Animal:0x00007fffdebf6590 id: 4, kind_of_animal: "Dog", created_at: 2020-02-10 19:39:50 UTC, updated_at: 2020-02-10 19:39:50 UTC>
[27] pry(main)> animal = Animal.find_or_create_by(kind_of_animal: params[:kind_of_animal])
=> #<Animal:0x00007fffdec29850 id: 4, kind_of_animal: "Dog", created_at: 2020-02-10 19:39:50 UTC, updated_at: 2020-02-10 19:39:50 UTC>
[28] pry(main)> current_user
=> #<Farmer:0x00007fffdeae8fe0
 id: 1,
 username: "farmerbrown",
 password_digest: "$2a$12$4BMf0lfNQPi8MkB0HKwDXei83nwCv3O3ahjgbd5Mn0MWyFlwuxd6W",
 created_at: 2020-02-10 19:17:09 UTC,
 updated_at: 2020-02-10 19:17:09 UTC>
[29] pry(main)> FarmerAnimal.create(farmer_id: current_user.id, animal_id: animal.id, quantity: params[:quantity])
=> #<FarmerAnimal:0x00007fffdec98d90
 id: 4,
 farmer_id: 1,
 animal_id: 4,
 quantity: 15,
 created_at: 2020-02-10 19:40:47 UTC,
 updated_at: 2020-02-10 19:40:47 UTC>