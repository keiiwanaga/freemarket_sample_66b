class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def confirm
    @item = Item.includes(:images).find(params[:item_id])
  end

  require 'payjp'
  Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_ACCESS_KEY)
  def purchase
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price, 
      card: params['payjp-token'], 
      currency: 'jpy'
    )
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      new_item_path
    end
  end

  def show
    @item = Item.includes(:images).find(params[:item_id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :condition_id, :prefecture_id, :delivery_days_id, :delivery_burden_id, :category_id, images_attributes: [:src]).merge(user_id: current_user.id)
  end
  
end

