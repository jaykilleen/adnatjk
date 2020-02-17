require 'rails_helper'

RSpec.describe "When a User joins an organisation", type: :feature do

  scenario "After a user signs in they are alerted to join an organisation if they are not already a member" do
    user = create(:user, organisation_id: nil)
    sign_in user
    expect(page).to have_content 'You must become a member of an organisation before you can proceed any further.'
  end

  scenario "If the user is not a member of an organisation they are directed to join an organisation" do
    user = create(:user, organisation_id: nil)
    sign_in user
    expect(current_path).to eq("/organisations")
  end

end