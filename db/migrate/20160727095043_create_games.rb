class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games, id: :uuid do |t|
      t.string :title
      t.string :website
      t.text :image

      t.timestamps
    end
  end
end
