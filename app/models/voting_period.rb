class VotingPeriod < ApplicationRecord
  validates :year, presence: true, uniqueness: true
  validates :active, inclusion: { in: [true, false] }
  has_many  :plays, dependent: :destroy
  has_many  :viewings, through: :plays
end
