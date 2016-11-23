class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body
      t.uuid :member_id
      t.uuid :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end
