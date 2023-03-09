class CreateArtWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :art_works do |t|
      t.string :title, null:false
      t.bigint :image_url, null:false
      t.references :artist, null:false, foreign_key: { to_table: :users }
      t.timestamps
    end

    add_index :art_works, :image_url, unique: true
    add_index :art_works, [:artist_id, :title], unique: true
  end
end
