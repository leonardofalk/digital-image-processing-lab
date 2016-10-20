class ImageCollection < ApplicationRecord
  has_many :images

  cattr_accessor :attached_images
end
