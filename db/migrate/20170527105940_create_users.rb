class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :job
      t.text :infomation
      t.string :Email
      t.string :face
      t.string :password
      t.timestamps
  end
end
