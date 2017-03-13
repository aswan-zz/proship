#lib/tasks/import.rake
require 'csv'

#task :import_countries, [:filename] => :environment do    
#    CSV.foreach('/Users/Adam/Documents/Aptana_Workspace/test1/lib/assets/countries.csv', :headers => true) do |row|
#      Country.create!(row.to_hash)
#    end
#end

task :import_airports, [:filename] => :environment do    
  filename = 'lib/assets/global_airports.csv'
  CSV.foreach(filename, :headers => true) do |row|
    Airport.create!(row.to_hash)
  end
end

task :import_countries, [:filename] => :environment do    
  filename = 'lib/assets/countries.csv'
  CSV.foreach(filename, :headers => true) do |row|
    Country.create!(row.to_hash)
  end
end

task :import_states, [:filename] => :environment do    
  filename = 'lib/assets/states.csv'
  CSV.foreach(filename, :headers => true) do |row|
    StateProv.create!(row.to_hash)
  end
  filename = 'lib/assets/provinces.csv'
  CSV.foreach(filename, :headers => true) do |row|
    StateProv.create!(row.to_hash)
  end
end
