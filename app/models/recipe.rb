class Recipe < ApplicationRecord
    has_many :ingredients, dependent: :destroy
        accepts_nested_attributes_for :ingredients, allow_destroy: true
    
    has_many :steps, dependent: :destroy
        accepts_nested_attributes_for :steps, allow_destroy: true

    # before_create :generateHandle

#   validates :name, :presence => true

    # def generateHandle
    #     self.handle = parameterize(self.title)
    # end
end
