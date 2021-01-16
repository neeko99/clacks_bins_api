class CreateTableAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :postcode
      t.string :address
      t.references :collection_group, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end
