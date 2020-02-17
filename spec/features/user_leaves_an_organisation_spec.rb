require 'rails_helper'

RSpec.describe "When a User leaves an organisation", type: :feature do

  scenario "They no longer belong to an organisation" do
    user = create(:user)
    sign_in user
    click_link('Leave')
    expect(page).to have_content 'You must become a member of an organisation before you can proceed any further.'
  end

  scenario "Their shifts are soft deleted" do
    user = create(:user)
    shift = create(:shift, user: user, organisation: user.organisation)
    sign_in user
    click_link('Leave')
    expect(user.shifts.where(organisation: user.organisation).count).to eq(0)
  end

  scenario "Their shifts can still be retrieved even if they are soft deleted" do
    user = create(:user)
    shift = create(:shift, user: user, organisation: user.organisation)
    sign_in user
    click_link('Leave')
    expect(user.shifts.unscoped.where(organisation: user.organisation).count).to eq(1)
  end

end