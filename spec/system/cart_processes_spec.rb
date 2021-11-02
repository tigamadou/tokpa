require 'rails_helper'

RSpec.describe "CartProcesses", type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user)
    user.add_role(:customer)
    visit new_user_session_path
    expect(page).to have_content 'Connexion'
    fill_in 'Email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Connexion'
    expect(current_path).to eq new_profile_path
  end

  describe 'creates user profile after'
  
end
