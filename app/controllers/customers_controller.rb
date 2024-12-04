class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @transactions = @customer.transactions.order(created_at: :desc)
  end
end
