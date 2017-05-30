class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.string :user_id
      t.string :article_id
      t.timestamps
    end
  end
end
