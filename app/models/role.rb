class Role < ActiveRecord::Base
  belongs_to :artist
  belongs_to :play
  has_one :voting_period, through: :play
  has_many :potential_nominations, as: :nominatable

  scope :for_voting_period, -> (voting_period) { joins(:voting_period)
    .where("voting_periods.year = ?", voting_period) }

  scope :for_current_voting_period, ->  { joins(:voting_period)
    .where("voting_periods.year = ?", Time.now.strftime("%Y")).joins(:artist).order('name ASC')}

  enum job: ["Director", "Actor", "Actress", "Music Director", "Choreographer",
    "Sound Designer", "Props Designer", "Set Designer", "Costume Designer", 
    "Lighting Designer", "Ensemble", "Writer", "Other"]

  def display_name
    formatted = ""
    formatted += character_or_job if artist
    formatted += play_info
  end

  def name
    display_name
  end

  private
  
  def character_or_job
    formatted = "#{artist.name}"
    formatted += (character.blank? ? " - " + job : " as " + character) 
    formatted += " - "
  end

  def play_info
    "#{play.title}, #{play.theater.name}"
  end
end