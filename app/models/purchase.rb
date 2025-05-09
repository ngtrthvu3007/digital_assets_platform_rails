class Purchase < ApplicationRecord
  belongs_to :asset
  belongs_to :customer
end
