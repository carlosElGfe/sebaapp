class Cookie < ApplicationRecord
    has_one_attached :image
    has_one :flayer
    has_one :photo
    
end
