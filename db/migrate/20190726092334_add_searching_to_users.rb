class AddSearchingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :searching, :boolean, default: false
  end
end
