class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def show
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      else
      render :new
      end
  end





    private
    def item_params
      params.require(:item).permit(:image, :name, :explan, :detail_category_id, :detail_status_id, :delivery_charge_id, :delivery_area_id, :delivery_indication, :price).merge(user_id: current_user.id)
    end



end
