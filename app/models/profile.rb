class Profile < ApplicationRecord
  belongs_to :user
  has_many :dogs
  has_many :profile_groups
  has_many :walks
  has_many :groups, through: :profile_groups
  has_many :profile_walks
end
