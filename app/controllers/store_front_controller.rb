class StoreFrontController < ApplicationController
  def index
    @products = Product.promoted
  end

  def show
    @product = Product.find(params[:id])
  end
end
