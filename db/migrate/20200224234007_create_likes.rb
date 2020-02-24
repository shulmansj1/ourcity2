class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :fan_id
      t.integer :article_id

      t.timestamps
    end
  end
end
