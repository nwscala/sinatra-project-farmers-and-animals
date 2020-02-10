class FarmerAnimal < ActiveRecord::Base
    belongs_to :farmer
    belongs_to :animal
end
