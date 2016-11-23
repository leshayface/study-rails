class CreateGameplays < ActiveRecord::Migration[5.0]
  def change
    create_table :gameplays, id: :uuid do |t|
      t.uuid :member_id
      t.uuid :game_id
      t.string :title
      t.string :link
      t.text :description
      t.text :slug
      t.timestamps
    end
    add_index :gameplays, :slug, unique: true
    add_index :gameplays, :member_id
    add_index :gameplays, :game_id
  end
end
