# spec/support/features/session_helpers.rb
# http://robots.thoughtbot.com/rspec-integration-tests-with-capybara

module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit sign_up_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign Up'
    end

    def sign_in user
      visit user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log In'
    end
    def sign_out
      visit root_path
      click_link 'Log Out'
    end
  end
end