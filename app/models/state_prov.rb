class StateProv < ActiveRecord::Base
  has_many :members
  def self.search(term)
    where('LOWER(name) LIKE :term', term: "#{term.downcase}%")
  end
end
