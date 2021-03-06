class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # ログインしてないユーザーはindex,showのみ許可
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  # set_itemで前に@itemを定義しているためmove_to_indexで@itemが使用できる。故に先にset_itemを記述している

  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user)
    # N+1問題を解消のためにincludes(:user)としている。これがないと情報のやり取りの量が膨大になる
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

    def destroy
      @item.destroy
      redirect_to root_path
    end







    private
    def item_params
      params.require(:item).permit( :name, :explan, :detail_category_id, :detail_status_id, :delivery_charge_id, :delivery_area_id, :delivery_indication_id, :price, images: []).merge(user_id: current_user.id)
    end
    # requireとpermitでは取得できない値をmergeしている。user_idはパラメーターのなかには含まれていないので現在ログイン中のユーザー情報を結合させている

    def set_item
      @item = Item.find(params[:id])
    end

    def move_to_index
      if @item.user != current_user || @item.purchase != nil 
          redirect_to root_path
      end
    end


end



