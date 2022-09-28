class ChangeUserTable < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.remove :password
      t.string :department
      t.index :username
    end
  end
end
