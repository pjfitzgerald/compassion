class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :animal
      t.string :adjective
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
