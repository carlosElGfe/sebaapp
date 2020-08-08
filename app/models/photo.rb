class Photo < ApplicationRecord
  belongs_to :cookie
  has_one_attached :picture
end
