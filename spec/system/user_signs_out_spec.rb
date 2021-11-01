require 'rails_helper'

RSpec.feature 'User signs out' do
  before(:each) do
    I18n.locale = :en
  end
  scenario 'user signed in' do
    user = create :user
    user.confirm
    sign_in user

    visit root_path

    click_link 'Sign Out'

    expect(page).to have_text 'Signed out successfully.'
    expect(page).to have_no_link 'Sign Out'
    expect(page).to have_current_path root_path
  end
end
