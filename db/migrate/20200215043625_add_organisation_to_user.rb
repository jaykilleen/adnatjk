class AddOrganisationToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :organisation, foreign_key: true
  end
end
