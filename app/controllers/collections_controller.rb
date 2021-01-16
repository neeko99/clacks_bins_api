class CollectionsController < ApplicationController

  has_scope :bin_type, type: :array
  has_scope :after_pickup_date
  has_scope :before_pickup_date

  def index
    page = params[:page] || 1
    collections = apply_scopes(Collection).includes(:bin_types).page(page.to_i)
    render json: {
      collections: collections.as_json(include: { bin_types: { only: :bin_type }}),
      page: page,
      total_pages: collections.total_pages
    }
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection, include: { bin_types: { only: :bin_type } }
  end
end

