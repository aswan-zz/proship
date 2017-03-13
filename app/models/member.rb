class Member < ActiveRecord::Base
  belongs_to :country#, :class_name => 'Country', :primary_key  => 'country_id'
  belongs_to :citizenship, :class_name => 'Country', :foreign_key  => 'citizenship_id'
  belongs_to :residency, :class_name => 'Country', :foreign_key  => 'residency_id'
  belongs_to :state_prov#, :class_name => 'StateProv', :primary_key  => 'state_prov_id'
  
end
