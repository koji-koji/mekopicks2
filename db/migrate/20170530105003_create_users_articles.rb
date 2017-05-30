class CreateUsersArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :users_articles, id: false do |t|
      t.references :user, foreign_key: true, null: false
      t.references :article, foreign_key: true, null: false
    end
  end
end
