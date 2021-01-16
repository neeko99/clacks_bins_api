class CreateCollectionGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_groups, id: :uuid, &:timestamps
  end
end
