class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :code,null: false
      t.integer :delivery_area_id,null: false
      t.string :municipality,null: false
      t.string :address,null: false
      t.string :number,null: false


      t.references :user,foreign_key:true
      t.references :item,foreign_key:true

      t.timestamps
    end
  end
end
