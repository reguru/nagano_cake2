class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def create

  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:address_number] == "2"
      @address = current_customer.addresses.find(params[:order][:address_number_2])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address_number] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

    else
      render :new
    end

    @cart_items = CartItem.find_by(customer_id: current_customer.id)
    @total = 0
  end

  def complete

  end

  private

  def order_params
    params.require(:order).permit(:address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
