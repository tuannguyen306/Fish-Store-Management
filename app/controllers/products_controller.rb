class ProductsController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.where('name LIKE ? OR category LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @products = Product.all
    end
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
