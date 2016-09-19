class SandwichesController < ApplicationController
  def index
    sandwiches = Sandwich.all
    render json: sandwiches
  end

  def show
    sandwiches = Sandwich.find(params[:id])
    render json: sandwiches
  end
end
