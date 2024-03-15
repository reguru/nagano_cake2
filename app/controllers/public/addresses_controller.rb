class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.address.all
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update

  end

  def destroy

  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
