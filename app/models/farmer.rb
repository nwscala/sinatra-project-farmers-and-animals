class Farmer < ActiveRecord::Base
    has_secure_password
    has_many :farmer_animals, dependent: :destroy
    has_many :animals, through: :farmer_animals
    validates :username, presence: true, uniqueness: true

    def slug
        self.username.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug_to_find)
        Farmer.all.find do |farmer|
          farmer.slug == slug_to_find
        end
    end
end
