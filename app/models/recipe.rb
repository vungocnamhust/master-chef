class Recipe < ApplicationRecord
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes, dependent: :destroy
    
    has_many :steps, dependent: :destroy
        
    has_one_attached :image
    validates :image, content_type: { in: %w[image/jpeg image/gif image/png image/jpg],
        message: "must be a valid image format" }, size: { less_than: 3.megabytes,
                      message:   "should be less than 3MB" }
        
    # before_create :generateHandle

#   validates :name, :presence => true

    # def generateHandle
    #     self.handle = parameterize(self.title)
    # end
end
