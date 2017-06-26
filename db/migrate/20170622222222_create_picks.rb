class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
