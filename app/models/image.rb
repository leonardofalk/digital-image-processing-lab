class Image < ApplicationRecord
  belongs_to :image_collection

  validates :name, :data, presence: true
end
