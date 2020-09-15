class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create, :pay_item]
  before_action :move_to_sign_in
  before_action :move_to_purchase
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

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_purchase
    if @item.sold_status == 1 #売切の場合は詳細ページを表示（購入不可）
      redirect_to item_path(@item.id)
    else @item.sold_status != 1 && current_user.id == @item.user_id #販売中、かつ出品商品の購入ページへその出品者がアクセスする際はトップページへ
      redirect_to root_path
    end
  end

end