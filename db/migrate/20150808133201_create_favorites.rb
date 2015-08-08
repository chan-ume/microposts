class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favoriter, index: true
      t.references :favoritepost, index: true

      t.timestamps null: false
      t.index [:favoriter_id, :favoritepost_id], unique: true
    end
  end
end
