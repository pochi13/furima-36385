class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]

  def index
   @form = Form.new
   if  current_user == @form2.user
    redirect_to root_path
    
   end
  end

  def create
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
    params.require(:form).permit(:code, :delivery_area_id, :municipality, :address, :number, :building).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
        amount: @form2.price,
        card: form_params[:token],    
        currency: 'jpy'                
      )
  end

  private
  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
