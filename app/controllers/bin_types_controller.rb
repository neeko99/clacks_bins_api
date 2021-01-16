class BinTypesController < ApplicationController
  def index
    collection_group = params[:collection_group]
    collection_group = CollectionGroup.find(collection_group)
    render json: collection_group.bin_types.pluck(:id, :bin_type)
  end
end

