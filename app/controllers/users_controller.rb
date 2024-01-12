class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    render json: { message: "User created successfully" }, status: :created
  end
end
