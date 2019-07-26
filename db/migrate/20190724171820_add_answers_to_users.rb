class AddAnswersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :answer_one, :integer, null: false, default: 0
    add_column :users, :answer_two, :integer, null: false, default: 0
    add_column :users, :answer_three, :integer, null: false, default: 0
    add_column :users, :answer_four, :integer, null: false, default: 0
    add_column :users, :answer_five, :integer, null: false, default: 0
    add_column :users, :category, :string, null: false, default: 0
  end
end
