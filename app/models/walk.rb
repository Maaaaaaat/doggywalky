class Walk < ApplicationRecord
  belongs_to :profile
  belongs_to :group
  has_many :profile_walks

  after_save :async_update, on: [:create, :update]

  private

  def async_update
    DeleteJob.perform_later(self.id)
  end

end
