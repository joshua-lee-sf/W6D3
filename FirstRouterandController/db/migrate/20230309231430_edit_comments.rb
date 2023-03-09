class EditComments < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :body
  end
end
