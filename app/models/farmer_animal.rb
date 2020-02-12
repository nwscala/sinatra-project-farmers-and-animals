class FarmerAnimal < ActiveRecord::Base
    belongs_to :farmer
    belongs_to :animal

    def self.cleanup
        FarmerAnimal.all.each do |farmer_animal|
            if !farmer_animal.farmer || !farmer_animal.animal
                farmer_animal.destroy
            end
        end
    end
end
