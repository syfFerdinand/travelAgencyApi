class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :SiteRef
      t.string :SiteName
      t.text :SiteDescription
      t.date :SiteOpeningDate
      t.integer :delete
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
