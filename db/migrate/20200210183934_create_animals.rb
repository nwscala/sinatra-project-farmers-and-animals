class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :kind_of_animal

      t.timestamps null: false
    end
  end
end
