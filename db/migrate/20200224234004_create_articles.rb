class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :restaurant_yelp_id
      t.string :author_name
      t.string :city
      t.date :date_published
      t.string :image_address
      t.string :publication
      t.string :title
      t.string :webaddress

      t.timestamps
    end
  end
end
