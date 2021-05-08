class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :image,              null: false
      t.string     :title,              null: false
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :area_id,            null: false
      t.integer    :days_to_ship_id,    null: false
      t.integer    :price,              null: false

      t.timestamps
    end
  end
end
