class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
   @form = Form.new
   @form2 = Item.find(params[:item_id])
   if  current_user.id != @form2 || current_user.id == @form2
    redirect_to root_path
    
   end
  end

  def create
    @form2 = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_b3c92ec42fc803da26a24bdb" 
    Payjp::Charge.create(
        amount: @form2.price,
        card: form_params[:token],    
        currency: 'jpy'                
      )
  end
end
