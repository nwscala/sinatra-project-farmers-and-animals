class Animal < ActiveRecord::Base
    has_many :farmer_animals
    has_many :farmers, through: :farmer_animals
end
