class Photo < ActiveRecord::Base
  #include ImageUploader[:image] # adds an `image` virtual attribute
end
