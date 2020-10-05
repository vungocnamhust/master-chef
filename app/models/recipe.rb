class Recipe < ApplicationRecord
    has_many :ingredients, inverse_of: :recipe, dependent: :destroy
        accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    
    has_many :steps, inverse_of: :recipe, dependent: :destroy
        accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
        
end
