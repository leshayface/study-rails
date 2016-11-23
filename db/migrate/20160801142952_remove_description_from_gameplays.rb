class RemoveDescriptionFromGameplays < ActiveRecord::Migration[5.0]
  def change
    remove_column :gameplays, :description
  end
end
