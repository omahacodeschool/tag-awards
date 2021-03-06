class Play < ApplicationRecord
  belongs_to :voting_period
  belongs_to :theater
  has_many   :nominatables, as: :nominee, dependent: :destroy
  validates  :title, presence: true, length: { maximum: 255 }
  validates  :title, uniqueness: { scope: [:theater_id, :voting_period_id] }
  has_many   :roles, dependent: :destroy
  has_many   :viewings, dependent: :destroy
  scope :for_current_voting_period, -> { joins(:voting_period).where('active = true') }

  def display_name
    "#{title}, #{theater.name}"
  end
end
