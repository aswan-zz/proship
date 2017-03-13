class Airport < ActiveRecord::Base
  def self.search(term)
    where('LOWER(name) LIKE :term OR LOWER(city) LIKE :term OR LOWER(iata_faa) LIKE :term', term: "#{term.downcase}%")
  end
end
