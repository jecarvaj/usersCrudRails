class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :rut
      t.string :first_name
      t.string :last_name
      t.string :mail
      t.date :birthday
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :rut, unique: true
  end
end
