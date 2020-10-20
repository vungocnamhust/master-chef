class Recipe < ApplicationRecord
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes, dependent: :destroy
    
    has_many :steps, dependent: :destroy
        
    has_one_attached :image
    # before_create :generateHandle

#   validates :name, :presence => true

    # def generateHandle
    #     self.handle = parameterize(self.title)
    # end
end
