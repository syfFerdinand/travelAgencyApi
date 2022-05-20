class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :CityRef
      t.string :CityName
      t.text :CityDescriptif
      t.date :CityDateCreated
      t.integer :delete

      t.timestamps
    end
  end
end
