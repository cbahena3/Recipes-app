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

end
