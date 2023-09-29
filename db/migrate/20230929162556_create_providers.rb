class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.string :street
      t.string :street2
      t.string :city
      t.string :state, limit: 2
      t.string :zipcode, limit: 5
      t.string :lat
      t.string :lon
      t.string :website
      t.string :phone
      t.string :fees
      t.string :schedule

      t.timestamps
    end
  end
end
