class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :url
      t.string :title
      t.string :text
      t.string :image
      t.string :source
      t.timestamps
    end
  end
end
