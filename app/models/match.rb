class Match < ApplicationRecord
  belongs_to :user
  belongs_to :match, class_name: "User"
end
