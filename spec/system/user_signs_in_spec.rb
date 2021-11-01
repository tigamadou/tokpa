require 'rails_helper'

RSpec.feature 'User signs in' do
  before(:each) do
    I18n.locale = :en
  end
  scenario 'with valid credentials' do
    user = create :user
    
    user.confirm
    user.add_role(:customer)
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text 'Please set up your profile'
    
  end

  scenario 'with invalid credentials' do
    user = build :user

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_text 'Invalid Email or password.'
    expect(page).to have_no_link 'Sign Out'
  end
end
