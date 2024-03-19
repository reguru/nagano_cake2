class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
