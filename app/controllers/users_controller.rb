class UsersController < ApplicationController
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?
                                  # カード情報がなければ

    customer = Payjp::Customer.retrieve(card.customer_token) 
    # Payjp::Customer.retrieve(card.customer_token)でpayjpの顧客情報を獲得している
    # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to action: "show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

