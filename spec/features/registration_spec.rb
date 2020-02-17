require 'rails_helper'

RSpec.describe "user registrations", type: :feature do

  it "user can create an account" do
    visit "/users/sign_up"
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_name', with: 'test'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create'
    expect(page).to have_content 'Log Out'
  end

end