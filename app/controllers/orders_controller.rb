class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @order = Order.new
    @order.build_address
  end

  def create
    @order = Order.new(order_params)
    @order.build_address
    if @order.save
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
    
  end
end
