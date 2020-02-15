require 'rails_helper'

RSpec.describe "user sessions", type: :feature do

  let(:user) { create :user }

  it "user must sign in" do
    visit "/users/sign_in"
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log In'
    expect(page).to have_content 'Signed in successfully'
  end

end