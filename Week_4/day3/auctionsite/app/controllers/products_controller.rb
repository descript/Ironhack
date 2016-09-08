class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def create
  end

  def destroy
  end

end
