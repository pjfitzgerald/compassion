class AddAnswersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :answer_one, :integer, default: 0
    add_column :users, :answer_two, :integer, default: 0
    add_column :users, :answer_three, :integer, default: 0
    add_column :users, :answer_four, :integer, default: 0
    add_column :users, :answer_five, :integer, default: 0
    add_column :users, :category, :string, null: false, default: 0
  end
end
