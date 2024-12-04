class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def index
    @sales = Sale.includes(:product).all
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

  def show
  end

  def edit
  end

  def update
    if @sale.update(sale_params)
      redirect_to sales_path, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sale.destroy
    redirect_to sales_path, notice: 'Sale was successfully deleted.'
  end

  private

  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:quantity, :total_price, :product_id)
  end
end
