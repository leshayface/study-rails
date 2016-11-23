class AddProfileDataToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :location, :string
    add_column :members, :date_joined, :date, default: Date.today
    add_column :members, :bio, :text
  end
end
