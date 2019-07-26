class Profile < ApplicationRecord
  belongs_to :user
  # validates :animal, :adjective, :description, :image, presence: true
end
