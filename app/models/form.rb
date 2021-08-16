class Form
  include ActiveModel::Model

  attr_accessor :code,:delivery_area_id,:municipality,:address,:building,:number,:user_id,:item_id,:token

  with_options presence: true do
    validates :code,format: { with: /\A\d{3}[-]\d{4}\z/ } 
    validates :delivery_area_id , numericality:{ other_than: 1 }
    validates :municipality
    validates :address
    validates :number  ,format: { with: /\A\d{10,11}\z/ } 
    validates :user_id
    validates :item_id
   
    end


  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create(code: code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building: building, number: number,purchase_id: purchase.id)
  end
end