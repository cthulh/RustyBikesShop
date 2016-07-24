class OrdersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @order
  end

  def show
    authorize! :show, @order
  end

  def new
    authorize! :new, @order
  end

  def create
    authorize! :create, @order
  end

  def destroy
    authorize! :destroy, @order
  end
end
