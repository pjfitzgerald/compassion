class Match < ApplicationRecord
  belongs_to :user
  belongs_to :partner, class_name: "User"
  has_one :chatroom, dependent: :destroy
  include PgSearch
  pg_search_scope :search_by_username,
    against: :username,
    using: {
      tsearch: { prefix: true }
    }
end
