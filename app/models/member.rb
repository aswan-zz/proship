class Member < ActiveRecord::Base
  belongs_to :country
  belongs_to :state_prov
end
