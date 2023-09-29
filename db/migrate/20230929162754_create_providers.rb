class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state, limit: 2
      t.string :zipcode, limit: 5
      t.string :website
      t.string :phone
      t.string :fees
      t.text :schedule
      
      t.timestamps
    end
  end
end
