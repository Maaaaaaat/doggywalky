class Walk < ApplicationRecord
  belongs_to :profile
  belongs_to :group
  has_many :profile_walks

    after_create :async_update
    after_update :async_update

private

  def async_update
    DeleteJob.perform_later(self.id)
  end

end
