class Animal < ActiveRecord::Base
    has_many :farmer_animals
    has_many :farmers, through: :farmer_animals
    
    def slug
        self.kind_of_animal.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug_to_find)
        Animal.all.find do |animal|
          animal.slug == slug_to_find
        end
    end

    def self.cleanup
        Animal.all.each do |animal|
            if animal.farmer_animals.empty?
                animal.destroy
            end
        end
    end
end
