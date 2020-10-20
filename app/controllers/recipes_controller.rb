class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroyStep, :index]

  # GET /recipes
  # GET /recipes.json
  def index
    searchValue = params['search']
    if (searchValue.blank?) 
      @recipes = Recipe.all
    else 
      @recipes = Recipe.where("name LIKE ?", "%" + searchValue +"%")
    end
    
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
    @recipe.image.attach(recipe_params[:image])
    @ingredients = recipe_params[:ingredients]
    @ingredients.each do |ingredient| 
      existIngredient = Ingredient.find_by_name(ingredient)
      if existIngredient.present?
        # add record to table IngredientRecipes
      else
        @recipe.ingredients << Ingredient.new({name: ingredient})
      end
    end

    @steps = recipe_params[:steps]
    @steps.each do |step| 
      @recipe.steps << Step.new({direction: step})
    end
    
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

  def destroyStep
    stepId = step_params[:id]
    step = Step.find_by_id(stepId)
    
    if step.destroy
      respond_to do |format|
        msg = {:status => "ok", :message => "Success", :data => {id: stepId}}
        format.json { render :json => msg }
      end
    else
      respond_to do |format|
        msg = {:status => "fail", :message => "Not found in db"}
        format.json{render :json => msg}
      end 
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:description, :name, :avatar_url, :chef_id, :image,
        :ingredients => [],
        :steps => [],)
    end

    def recipe_search_params
      params.permit(:search)
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

    private 
    def step_params
      params.require(:step).permit(:id)
    end
    

end
