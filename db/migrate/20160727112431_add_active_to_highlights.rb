class AddActiveToHighlights < ActiveRecord::Migration[5.0]
  def change
    add_column :highlights, :active, :boolean, default: false
  end
end
