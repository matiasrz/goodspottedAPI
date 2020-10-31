class Api::V1::CountriesController < ApplicationController
  def index
    countries = Country.all
    render locals: { countries: countries }
  end

  def show
    country = find_country
    head(:not_found) && return unless country.present?

    render locals: { country: country }
  end

  def create
    country = Country.new country_params
    unless country.save
      render json: country.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { country: country }
  end

  def update
    country = find_country
    unless country.update(country_params)
      render json: country.errors, status: :unprocessable_entity
      return
    end

    render :show, locals: { country: country }
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end

  def find_country
    Country.find_by id: params[:id]
  end
end
