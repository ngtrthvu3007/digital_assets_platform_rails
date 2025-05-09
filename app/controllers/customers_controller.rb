class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def downloads
    @customer = Customer.find(params[:id])
    @assets = @customer.assets

    if params[:asset_id]
      asset = @assets.find_by(id: params[:asset_id])
      if asset
        send_file asset.file_url, filename: asset.title, type: "application/octet-stream", disposition: "attachment"
      else
        redirect_to downloads_customer_path(@customer), alert: "Asset not found or you don't have access to it."
      end
    end
  end
end