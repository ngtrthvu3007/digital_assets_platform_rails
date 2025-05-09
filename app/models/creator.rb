class Creator < ApplicationRecord
  has_many :assets, dependent: :destroy
end