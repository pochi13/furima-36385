class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]
  before_action :set_move,only: [:index, :create]

  def index
   @form = Form.new
  end

  def create
    redirect_to new_card_path and return unless current_user.cards[0].present?
    @form = Form.new(form_params)
    if @form.valid?
      item_pay
      @form.save
      return redirect_to root_path
    else
      render :index
    end
   end



  
   

  private
  def form_params
    params.require(:form).permit(:code, :delivery_area_id, :municipality, :address, :number,:building).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer_token = current_user.cards[0].customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
    amount: @item.price,
        customer: customer_token, # 顧客のトークン   
        currency: 'jpy'                
      )

    end
  

  private
  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def set_move
    if @item.user == current_user || @item.purchase != nil 
        redirect_to root_path
    end
  end


end
