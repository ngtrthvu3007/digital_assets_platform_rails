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
  end
end