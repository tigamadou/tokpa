require 'rails_helper'

RSpec.feature 'User signs up' do
  scenario 'with valid data' do
    visit new_user_registration_path

    fill_in 'Email', with: 'username@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_text 'A message with a confirmation link has been sent to your email address'
    expect(page).to have_link 'Login'
    expect(page).to have_current_path root_path
  end

  scenario 'with invalid data' do
    visit new_user_registration_path

    click_button 'Sign up'

    expect(page).to have_text "Email can't be blank"
    expect(page).to have_text "Password can't be blank"
    expect(page).to have_no_link 'Sign Out'
  end
end
