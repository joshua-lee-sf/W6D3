class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
        t.references :art_work, null: false, foreign_key: {to_table: :art_works}
        t.references :viewer, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
