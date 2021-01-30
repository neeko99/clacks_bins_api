class CollectionsController < ApplicationController

  has_scope :bin_type, type: :array
  has_scope :after_pickup_date
  has_scope :before_pickup_date
  has_scope :postcode

  def index
    page = params[:page] || 1
    collections = apply_scopes(Collection).includes(:bin_types).page(page.to_i)
    render json: {
      collections: collections.as_json(**Collection.json_options),
      page: page,
      total_pages: collections.total_pages
    }
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection, **Collection.json_options
  end
end

