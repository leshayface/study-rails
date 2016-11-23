class AddStatusToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :status, :boolean, default: true
  end
end
