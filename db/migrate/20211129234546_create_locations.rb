class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :region
      t.string :county
      t.string :address
      t.boolean :available, default: "true"

      t.timestamps
    end
  end
end
