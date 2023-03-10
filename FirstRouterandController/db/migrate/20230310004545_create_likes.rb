class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # like - user
      t.references :user, null:false, foreign_key: { to_table: :users }
      t.references :art_work, null:false, foreign_key: { to_table: :art_works }
      t.timestamps
    end
  end
end
