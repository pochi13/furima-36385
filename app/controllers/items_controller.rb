class ItemsController < ApplicationController

  before_action :authenticate_user!, expect: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :update]
  before_action :move_to_index2, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
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
   end

  def update
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

    def set_item
      @item = Item.find(params[:id])
    end

    def move_to_index
      if @item.user != current_user
          redirect_to root_path
      end
    end

    def move_to_index2
      if  @item.purchase != nil 
        redirect_to root_path
      end
    end
end



