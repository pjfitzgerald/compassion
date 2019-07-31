require 'csv'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :matches, dependent: :destroy
  has_many :partners, through: :matches
  has_many :inverse_matches, class_name: "Match", foreign_key: "partner_id"
  has_many :inverse_partners, through: :inverse_matches, source: :user
  has_many :profiles, dependent: :destroy
  has_one :journal, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_journal

  private

  def create_journal
    Journal.create(user: self)
    Post.create(title: "Your first journal post!", content: "The journal allows you to log your thoughts, in a 'your-eyes-only' interface. Journalling is recommended by many leading psychologists as a way to clear your mind of built up negative thoughts.")
  end
end
