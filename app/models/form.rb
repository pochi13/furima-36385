class Form
  # formオブジェクトを利用している理由は商品購入履歴であるpurchaseテーブルと発送先住所であるaddressテーブルの２つに保存したいから。異なった２つのテーブルを保存する際に使用する。ちなみに３つ以上でも使用可能

  include ActiveModel::Model
  # 上記の記述でformオブジェクトにモデルの性質を持たせる

  attr_accessor :code,:delivery_area_id,:municipality,:address,:building,:number,:user_id,:item_id,:token
  # コントローラーのストロングパラーメーターを受け取る役割として記述。これがないと保存する値として対象にならない。コントローラーのストロングパラメーターとイコールになる

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
    # 濃い青がDBのカラム名、薄い青はattr_accessorでもらってきた値
    Address.create(code: code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building: building, number: number,purchase_id: purchase.id)
  end
end


