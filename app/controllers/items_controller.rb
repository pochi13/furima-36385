class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]



  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end





    private
    def item_params
      params.require(:item).permit(:image, :name, :explan, :detail_category_id, :detail_status_id, :delivery_charge_id, :delivery_area_id, :delivery_indication_id, :price).merge(user_id: current_user.id)
    end




end


