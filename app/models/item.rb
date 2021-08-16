class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_status
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_indication
  has_many_attached :images
  belongs_to :user
  has_one  :purchase
  has_many  :messages

  
  
  with_options presence: true do
    validates :name
    validates :explan
    validates :images
    with_options  numericality: { other_than: 1 } do 
      validates :detail_category_id
      validates :detail_status_id
      validates :delivery_charge_id 
      validates :delivery_area_id 
      validates :delivery_indication_id
    end
  end
  validates :price ,format: { with: /\A[0-9]+\z/ } 
  validates_inclusion_of :price, in: 300..9999999
end


