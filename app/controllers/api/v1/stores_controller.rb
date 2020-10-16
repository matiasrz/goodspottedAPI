class Api::V1::StoresController < ApplicationController
  def index
    stores = Store.all
    render locals: { stores: stores }
  end

  def show
    store = find_store
    head(:not_found) && return unless store.present?

    render locals: { store: store }
  end

  def create
    store = Store.new store_params
    unless store.save
      render json: store.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { store: store }
  end

  def update
    store = find_store
    unless store.update(store_params)
      render json: store.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { store: store }
  end

  private

  def store_params
    params.require(:store).permit(:country_id, :name)
  end

  def find_store
    Store.find_by id: params[:id]
  end
end
