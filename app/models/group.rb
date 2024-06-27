class Group < ApplicationRecord

  has_many :walks
  has_many :profile_groups
  has_many :profiles, through: :profile_groups
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

end
