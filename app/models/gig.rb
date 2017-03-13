class Gig < ActiveRecord::Base
  belongs_to :chair
  belongs_to :room
  belongs_to :rank
end
