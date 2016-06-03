class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :destroy, :update]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @categories = Category.all
  end

  def seller
    @items = Item.where(user: current_user).order("created_at DESC")
  end
  # GET /items/1
  # GET /items/1.json
  def show
    @categories = Category.all
  end

  # GET /items/new
  def new
    @item = Item.new
    @category = Category.new
    @categories = Category.all
  end

  def search
    @categories = Category.all
    if params[:category].blank? && params[:search].blank?
      @items = Item.all.order(created_at: :desc).page(params[:page]).per(20)
    else
      @items = Item.search(params)
    end
  end
  # GET /items/1/edit
  def edit
    @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.user.name = current_user.name
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def check_user
      if current_user != @item.user
        redirect_to root_url, alert: "Sorry, You're not the owner of this Item"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :price, :location, :category_id, :image)
    end
end
