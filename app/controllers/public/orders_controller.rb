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

  def comfirm

  end

  def complete

  end
  
  private
  
  def order_params
    params.require(:order).permit(:address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
