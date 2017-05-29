class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image
      t.string :source

      t.timestamps
    end
  end
end
