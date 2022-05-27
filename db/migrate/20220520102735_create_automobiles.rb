class CreateAutomobiles < ActiveRecord::Migration[7.0]
  def change
    create_table :automobiles do |t|
      t.string :autoRef
      t.string :autoBrand
      t.string :autoModel
      t.text :autoDescription
      t.integer :autoAvailable

      t.timestamps
    end
  end
end
