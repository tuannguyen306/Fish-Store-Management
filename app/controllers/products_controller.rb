class ProductsController < ApplicationController
  def index
    # Fetch all products from the database and store them in @products
    @products = Product.all
  end

  def show
    # Fetch a single product by its ID (you can display more details in the show view)
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

  # Strong parameters to whitelist product attributes for creating/updating products
  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
