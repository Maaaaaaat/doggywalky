class Group < ApplicationRecord
  has_many :walks
  has_many :profile_groups
end
