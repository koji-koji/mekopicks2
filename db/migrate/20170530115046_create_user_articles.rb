class CreateUserArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_articles, id: false do |t|
      t.references :user, foreign_key: true, null: false, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
      t.references :article, foreign_key: true, null: false, options: 'ON UPDATE CASCADE ON DELETE CASCADE'
    end
  end
end
