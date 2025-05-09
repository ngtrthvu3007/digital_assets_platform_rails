class Customer < ApplicationRecord
  has_many :purchases
  has_many :assets, through: :purchases
end
