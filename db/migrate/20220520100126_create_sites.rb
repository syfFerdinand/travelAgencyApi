class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :siteRef
      t.string :siteName
      t.text :siteDescription
      t.date :siteOpeningDate
      t.belongs_to :city

      t.timestamps
    end
  end
end
