class AddAnsweredToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :answered, :boolean, default: false
  end
end
