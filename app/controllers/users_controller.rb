class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shop = Shop.all
    @categories = Category.all
  end
end
