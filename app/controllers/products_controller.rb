class ProductsController < ApplicationController
  def index
    @products = Product.all

    # Search by name or category
    if params[:query].present?
      @products = @products.where('name LIKE ? OR category LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # Filter by Category
    @products = @products.where(category: params[:category]) if params[:category].present?

    # Sort by Price
    sort_order = params[:sort_order] || "asc"
    @products = @products.order(price: sort_order)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "Product successfully created!"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: "Product successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product successfully deleted!"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :category, :image)
  end
end
