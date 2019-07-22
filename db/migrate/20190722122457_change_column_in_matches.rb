class ChangeColumnInMatches < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :user1_id, :user_id
    rename_column :matches, :user2_id, :partner_id
  end
end
