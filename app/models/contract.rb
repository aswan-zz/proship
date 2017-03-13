class Contract < ActiveRecord::Base
  belongs_to :gig
  belongs_to :contract_status
end
