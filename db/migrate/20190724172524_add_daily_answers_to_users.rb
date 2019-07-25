class AddDailyAnswersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :d_answer_one, :string, default: ""
    add_column :users, :d_answer_two, :string, default: ""
    add_column :users, :d_answer_three, :string, default: ""
  end
end
