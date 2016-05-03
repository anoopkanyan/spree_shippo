class CreatePackageTypes < ActiveRecord::Migration
  def change
    create_table :package_types do |t|
      t.string :carrier
      t.string :parcel
      t.decimal :dimension_length
      t.decimal :dimension_height
      t.decimal :dimension_width
      t.string :dimension_unit
      t.string :image_url
      
      t.timestamps null: false
    end
  end
end
