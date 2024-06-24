class Walk < ApplicationRecord
  belongs_to :profile
  belongs_to :group
  has_many :profile_walks
end
