class Tray < ApplicationRecord
  belongs_to :order
  belongs_to :tree
end
