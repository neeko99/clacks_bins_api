class CreateBinTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :bin_types, id: :uuid do |t|
      t.string :bin_type
      t.timestamps
    end
  end
end
