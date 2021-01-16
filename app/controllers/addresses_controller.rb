class AddressesController < ApplicationController
  def index
    page = params[:page] || 1
    addresses = Address.page(page.to_i)
    render json: { 
      addresses: addresses,
      page: page,
      total_pages: addresses.total_pages
    }
  end

  def show
    address = Address.find(params[:id])

    render json: address
  end
end

