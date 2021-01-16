class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections, id: :uuid do |t|
      t.date :pickup_date, null: false
      t.references :collection_group, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end

    create_join_table :collections, :bin_types, column_options: {type: :uuid}
  end
end
