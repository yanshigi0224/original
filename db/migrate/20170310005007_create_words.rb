class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.references :user, index: true, foreign_key: true
      t.string :keyword

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
