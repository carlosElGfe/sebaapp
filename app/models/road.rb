class Road < ApplicationRecord
  belongs_to :tree
  belongs_to :order
end
