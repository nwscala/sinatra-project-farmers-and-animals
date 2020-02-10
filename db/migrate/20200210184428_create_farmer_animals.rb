class CreateFarmerAnimals < ActiveRecord::Migration
  def change
    create_table :farmer_animals do |t|
      t.integer :farmer_id
      t.integer :animal_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
