require 'rails_helper'

RSpec.describe "user sessions", type: :feature do

  it "user must sign in" do
    visit "/users/sign_in"
    expect(page).to have_current_url("/users/sign_in")
  end

end