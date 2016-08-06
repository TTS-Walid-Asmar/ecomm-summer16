class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_for_admin

  def index
    @products = Product.find_each
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
      if @product.save
        redirect_to @product
      else
        render :edit
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end
  private

  def product_params
    params.require(:product).permit(:name, :promoted, :stock, :price, :description)
  end

  def check_for_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
