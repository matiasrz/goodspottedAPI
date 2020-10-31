class Api::V1::ProductProspectsController < ApplicationController
  def index
    prospects = ProductProspect.where(status: %i[pending manually_revision])
                               .paginate(page: params[:page])
    prospects_count = ProductProspect.where(status: %i[pending manually_revision]).size
    render locals: { prospects: prospects, prospects_count: prospects_count }
  end

  def show
    prospect = find_product_prospect
    head(:not_found) && return unless prospect.present?

    render locals: { prospect: prospect }
  end

  def create
    prospect = ProductProspect.new product_prospect_params
    unless prospect.save
      render json: prospect.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { prospect: prospect }
  end

  def update
    prospect = find_product_prospect
    unless prospect.update(product_prospect_params)
      render json: prospect.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { prospect: prospect }
  end

  private

  def product_prospect_params
    params.require(:product_prospect)
          .permit(:name, :position, :country, :store)
  end

  def find_product_prospect
    ProductProspect.find_by id: params[:id]
  end
end
