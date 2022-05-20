class CreateGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :guides do |t|
      t.string :RefGuide
      t.string :LastName
      t.string :FirstName
      t.integer :Age
      t.string :sex
      t.integer :available
      t.integer :delete

      t.timestamps
    end
  end
end
