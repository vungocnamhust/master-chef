class IngredientController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :destroy

  def destroy
    recipeId = ingredient_params[:recipe_id]
    ingredientId = ingredient_params[:ingredient_id]
    ingredientRecipe = IngredientRecipe.find_by(recipe_id: recipeId, ingredient_id: ingredientId)
   
    if !ingredientRecipe.nil?
      respond_to do |format|
        msg = {:status => "ok", :message => "Success", :data => {id: ingredientId}}
        format.json {render :json => msg }
      end
      ingredientRecipe.destroy
    else
      respond_to do |format|
        format.json 
      end
    end
    

  end

  private 
  def ingredient_params
    params.require(:ingredient).permit(:recipe_id, :ingredient_id)
  end
end
