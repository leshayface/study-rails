class CreateHighlights < ActiveRecord::Migration[5.0]
  def change
    create_table :highlights, id: :uuid do |t|
      t.text :image
      t.string :title
      t.text :description
      t.text :action_link
      t.string :action_text
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
