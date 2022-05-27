class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :cityRef
      t.string :cityName
      t.text :cityDescriptif
      t.date :cityDateCreated
      
      t.timestamps
    end
  end
end