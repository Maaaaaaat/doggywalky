class ProfileGroup < ApplicationRecord
  belongs_to :group
  belongs_to :profile
  has_one_attached :photo
end
