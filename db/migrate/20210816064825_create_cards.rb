class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user,foreign_key: true
      t.text :customer_token, null: false

      t.timestamps
    end
  end
end
