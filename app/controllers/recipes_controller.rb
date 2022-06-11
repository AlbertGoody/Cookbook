class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

 def create
   @recipe = Recipe.new(
    user_id: current_user.id,
    name: recipe_params[:name],
    description: recipe_params[:description]
  )
   @recipe.save!
   redirect_to @recipe
 end

 def edit
  @recipe = Recipe.find(params[:id])
 end

 def update
  @recipe = Recipe.find(params[:id])
  @recipe.update!(recipe_params)
  redirect_to @recipe
 end

 def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy!
  redirect_to recipes_path
 end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :rating)
  end

end
