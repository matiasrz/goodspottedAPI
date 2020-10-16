class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render locals: { products: products }
  end

  def show
    product = find_product
    head(:not_found) && return unless product.present?

    render locals: { product: product }
  end

  def create
    product = Product.new product_params
    unless product.save
      render json: product.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { product: product }
  end

  def update
    product = find_product
    unless product.update(product_params)
      render json: product.errors, status: :unprocessable_entity
      return
    end

    render locals: { product: product }
  end

  private

  def product_params
    params.require(:product).permit(:product_prospect_id, :name, :price)
  end

  def find_product
    Product.find_by id: params[:id]
  end
end
