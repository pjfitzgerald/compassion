class Match < ApplicationRecord
  belongs_to :user
  belongs_to :partner, class_name: "User"
  has_one :chatroom, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :search_by_partner_id,
    against: :partner_id,
    using: {
      tsearch: { prefix: true }
    }
end


# User.find(:id).matches.search_by_partner_id(:partner_id)
## returns a users' matches
# User.find(1).matches.search_by_partner_id("2")[0].partner_id
## returns the partner_id of the retrieved user
# User.find(User.find(1).matches.search_by_partner_id("2")[0].partner_id).username
