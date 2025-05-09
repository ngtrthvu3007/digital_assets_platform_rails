class PurchasesController < ApplicationController
  def new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    asset_ids = params[:asset_ids]

    if asset_ids.blank?
      return redirect_to new_customer_purchase_path(@customer), alert: "Please select at least one asset to purchase."
    end

    asset_ids.each do |id|
      asset = Asset.find(id)
      @customer.purchases.create!(asset: asset, price: asset.price)
    end

    redirect_to downloads_customer_path(@customer), notice: "Purchase successful."
  end
end
