class HomeController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.all
    @shops = Shop.all
    @users = User.all
  end
end
