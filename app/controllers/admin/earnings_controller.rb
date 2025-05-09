class Admin::EarningsController < ApplicationController
  def index
    earnings = Asset
      .includes(:creator)
      .joins(:purchases)
      .group(:creator_id)
      .sum('purchases.price')
      .map do |creator_id, total|
        creator = Creator.find(creator_id)
        { creator_id: creator_id, creator_name: creator.name, total_earnings: total.to_f }
      end

    render json: earnings
  end
end
