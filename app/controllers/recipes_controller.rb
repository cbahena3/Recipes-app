class RecipesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

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
      user_id: current_user.id
    )
    render :show
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if current_user.id == @recipe.user_id
      @recipe.update(
      name: params[:name] || @recipe.name,
      image: params[:image] || @recipe.image,
      description: params[:description] || @recipe.description,
      ingredients: params[:ingredients] || @recipe.ingredients,
      instructions: params[:instructions] || @recipe.instructions,
    )
      render :show
    else
      render json: {message: "Please login with the account used to create recipe"}
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if current_user.id == @recipe.user_id
      @recipe.destroy
      render json: {message: "Recipe deleted succesfully"}
    else
      render json: {message: "Please login with the account used to create recipe in order to delete"}
    end
  end
end
