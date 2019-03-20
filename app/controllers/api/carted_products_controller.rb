class Api::CartedProductsController < ApplicationController
  
  def index
    if current_user
      @carted_products = current_user.carted_products
      render 'index.json.jbuilder'
    else
      render json: []
    end
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      # order_id: params[:order_id],
      quantity: params[:quantity],
      # status: "carted"
    )
    @carted_product.save
    render 'show.json.jbuilder'
  end
end