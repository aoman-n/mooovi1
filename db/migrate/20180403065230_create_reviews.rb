class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :nickname, null: false, unique: true
      t.integer :rate
      t.text :review, null: false
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
