class EditArtwork < ActiveRecord::Migration[7.0]
  def change
    change_column :art_works, :image_url, :text
  end
end
