class AddIdNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :id_name, :string
		add_index :users, :id_name, unique: true
  end
end
