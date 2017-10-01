class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @order = Order.new
    @order.build_address
    @order.food_item_id = params[:food_item_id]
    @order.user_id = current_user.id
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      @order.paid
      flash[:notice] = "Successfully created order."
      redirect_to @order
    else
      render :action => 'new'
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:pay_type, :food_item_id, :user_id, address_attributes: [:name, :mobile, :address_line_1, :address_line_2, :user_id, :locality_id])
  end
end
