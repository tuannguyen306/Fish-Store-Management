class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # Index action - loads all sales with eager-loaded products
  def index
    @sales = Sale.includes(:product).all
  end

  # New action - initializes a new sale
  def new
    @sale = Sale.new
  end

  # Create action - creates a new sale
  def create
    @sale = Sale.new(sale_params)
    
    # If sale is saved successfully, redirect to sales index
    if @sale.save
      redirect_to sales_path, notice: 'Sale was successfully created.'
    else
      render :new
    end
  end

  # Show action - shows details of a specific sale
  def show
  end

  # Edit action - prepares sale for editing
  def edit
  end

  # Update action - updates the sale with new data
  def update
    if @sale.update(sale_params)
      redirect_to sales_path, notice: 'Sale was successfully updated.'
    else
      render :edit
    end
  end

  # Destroy action - deletes a sale
  def destroy
    @sale.destroy
    redirect_to sales_path, notice: 'Sale was successfully deleted.'
  end

  private

  # Set sale - finds the sale by its ID
  def set_sale
    @sale = Sale.find(params[:id])
  end

  # Sale params - whitelists the attributes to be set via forms
  def sale_params
    params.require(:sale).permit(:quantity, :total_price, :product_id)
  end
end
