class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end

  def create
    @recipe = Recipe.create(
      name: params[:name],
      image: params[:image],
      description: params[:description],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
    )
    render :show
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(
      name: params[:name] || @recipe.name,
      image: params[:image] || @recipe.image,
      description: params[:description] || @recipe.description,
      ingredients: params[:ingredients] || @recipe.ingredients,
      instructions: params[:instructions] || @recipe.instructions,
    )
    render :show
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "Recipe deleted succesfully"}
  end

end
