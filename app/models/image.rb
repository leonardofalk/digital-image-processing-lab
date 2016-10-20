class Image < ApplicationRecord
  validates :name, :data, presence: true
end
