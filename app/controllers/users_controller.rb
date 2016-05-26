class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shop = Shop.all
  end


end
