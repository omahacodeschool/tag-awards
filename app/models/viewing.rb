class Viewing < ActiveRecord::Base
  belongs_to :user
  belongs_to :play
end
