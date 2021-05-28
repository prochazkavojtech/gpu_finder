class CreateGraphicCards < ActiveRecord::Migration[6.1]
  def change
    create_table :graphic_cards do |t|
      t.string :name
      t.string :price
      t.string :stock
      t.string :link
      t.string :identifier
      t.string :shop

      t.timestamps
    end
  end
end
