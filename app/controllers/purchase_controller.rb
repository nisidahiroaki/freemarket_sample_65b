class PurchaseController < ApplicationController

  require 'payjp'
  
  before_action :set_card, :set_item, only: [:index, :pay, :done]
  
  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: “cards”, action: “new”
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end
  
  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price,          #支払金額を引っ張ってくる
    customer: @card.customer_id,  #顧客ID
    currency: 'jpy',              #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end
  
  def done
    @item.update(buyer_id: current_user.id)
  end
  
  private
  
  def set_card
    @card = Card.where(user_id: current_user).first
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end





