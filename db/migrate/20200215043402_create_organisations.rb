class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.decimal :hourly_rate, precision: 10, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
