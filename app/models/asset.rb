class Asset < ApplicationRecord
  belongs_to :creator
  has_many :purchases

  validates :title, :file_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end