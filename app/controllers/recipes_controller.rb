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

    # check recipe fields (name, des, url, id) not blank
    if checkRecipe(@recipe) 
      isValid = true
      @recipe.save 
      @ingredients = recipe_params[:ingredients]
      if checkIngredientInput(@ingredients)
      @ingredients.each do |ingredient| 
        existIngredient = Ingredient.find_or_create_by(name:ingredient)
        if existIngredient.nil?
          existIngredient = Ingredient.find_by(name: ingredient)
        end
  
        @ingredientRecipe = IngredientRecipe.new 
        @ingredientRecipe.recipe_id = @recipe.id 
        @ingredientRecipe.ingredient_id = existIngredient.id
        @ingredientRecipe.save 
      end
      end
      
      @steps = recipe_params[:steps]
      if checkStepInput(@steps)
      @steps.each do |step| 
        @recipe.steps << Step.new({direction: step})
      end
    end
    else 
      isValid = false
      flash.now[:alert] = 'Error while sending message!'
    end

    respond_to do |format|
      if isValid
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

    def checkRecipe(recipe)
      return recipe != nil && !recipe.name.blank? && !recipe.chef_id.blank? && !recipe.avatar_url.blank?
    end

    def checkStepInput(input)
      return !input.nil? && input.length > 0
    end
    
    def checkIngredientInput(input)
      return !input.nil? && input.length > 0
    end
    

end
