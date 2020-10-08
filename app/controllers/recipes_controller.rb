class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  def createRecipe
    render json: {recipe: params[:recipe], ingredient: params[:ingredients], step: params[:steps]}
  end

  # POST /recipes
  # POST /recipes.json
  def create

    @recipe = Recipe.new

    @recipe.name = recipe_params[:name]
    @recipe.description = recipe_params[:description]
    @recipe.avatar_url = recipe_params[:avatar_url]
    @recipe.chef_id = recipe_params[:chef_id]
    @ingredients = recipe_params[:ingredients]
    @ingredients.each do |ingredient| 
      existIngredient = Ingredient.find_by_name(ingredient)
      if existIngredient.present?
        # add record to table IngredientRecipes
      else
        @recipe = Recipe.joins(:ingredient_recipes).where("ingredient_recipes.recipe_id = ?", @recipe.id).select("*")
        return render json: {data: @recipe}
        # @recipe.ingredients << Ingredient.new({name: ingredient})
      end
    end

    @steps = recipe_params[:steps]
    @steps.each do |step| 
      @recipe.steps << Step.new({direction: step})
    end
    
    # return render @recipe_params[:ingredients]
    # @ingredients.each do |i|
    #   existIngredient = Ingredient.find_by_name(i)
    #   if existIngredient.present?
    #     RecipeIngredient.create({
    #       recipe_id: @recipe.id,
    #       ingredient_id: existIngredient.id
    #     })
    #   else
    #     @recipe.ingredients << i 
    #   end
    # end

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    # Check presence 
    recipe = @recipe
    ingredients = recipe_params[:ingredients]
    
    if ingredients != nil 
      ingredients.each do |ingredient| 
        recipe.ingredients << Ingredient.new({name: ingredient})
      end
    end

    
    steps = recipe_params[:steps]


    if steps != nil 
      steps.each do |step| 
        recipe.steps << Step.new({direction: step})
      end
    end

    respond_to do |format|
      if @recipe.update(ingredients: recipe.ingredients, steps: recipe.steps)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy    
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:description, :name, :avatar_url, :chef_id, 
        :ingredients => [],
        :steps => [],)
    end
end
