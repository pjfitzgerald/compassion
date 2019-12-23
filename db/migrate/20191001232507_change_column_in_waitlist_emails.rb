class ChangeColumnInWaitlistEmails < ActiveRecord::Migration[5.2]
  def change
    rename_column :waitlist_emails, :email, :address
  end
end
