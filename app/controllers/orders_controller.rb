class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create, :pay_item]
  before_action :move_to_root_path
  before_action :move_to_self_path
  before_action :authenticate_user!

  def new
  end
  
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      @item.update(sold_status:1)
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.permit(:token, :phone, :prefecture_id, :building, :address_line, :item_id, :city, :postal_code).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    redirect_to root_path unless user_signed_in?
  end

  def move_to_self_path
    redirect_to root_path unless current_user.id != @item.user_id
  end



end