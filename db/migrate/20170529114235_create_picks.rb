class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.string :user_id, foreign_key: true
      t.string :article_id, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
