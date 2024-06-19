class Group < ApplicationRecord
  has_many :walks
  has_many :profile_groups

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

end
