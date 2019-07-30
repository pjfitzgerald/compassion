require 'csv'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :matches, dependent: :destroy
  has_many :partners, through: :matches
  has_many :inverse_matches, class_name: "Match", foreign_key: "partner_id"
  has_many :inverse_partners, through: :inverse_matches, source: :user
  has_many :profiles, dependent: :destroy
  has_one :journal

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
