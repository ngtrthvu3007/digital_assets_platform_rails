# app/controllers/admin/earnings_controller.rb
class Admin::EarningsController < ApplicationController
  def index
    earnings = Asset
      .joins(:purchases)
      .group(:creator_id)
      .sum('purchases.price')
      .map do |creator_id, total|
        { creator_id: creator_id, total_earnings: total.to_f }
      end

    render json: earnings
  end
end
