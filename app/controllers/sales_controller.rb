class SalesController < ApplicationController
  before_action :set_product, only: [:create, :show]

  def index
    @products = Product.all
    @sales = Sale.all  # Optionally display sales on the index page
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to sales_path, notice: 'Sale was successfully created.'
    else
      render :new
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])  # Ensure the correct product is selected for the sale
  end

  def sale_params
    params.require(:sale).permit(:quantity, :total_price, :product_id)
  end
end
