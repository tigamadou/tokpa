require 'rails_helper'

RSpec.describe "AccessRestrictions", type: :system do
  before do
    driven_by(:rack_test)
    I18n.locale = :fr
  end

  describe "Admin Panel test" do
    it 'Access the admin panel' do
      user = FactoryBot.create(:user)
      user.add_role(:admin)
      visit new_user_session_path
      expect(page).to have_content 'Connexion'
      fill_in 'Email', with: user.email
      fill_in 'Mot de passe', with: user.password
      click_button 'Connexion'
      expect(current_path).to eq root_path
      expect(page).to have_content 'Administration'
      visit rails_admin.dashboard_path
      expect(page).to have_content 'Tokpa Admin'
    end

    it 'Do not access the admin panel' do
      user = FactoryBot.create(:user)
      user.add_role(:customer)
      visit new_user_session_path
      expect(page).to have_content 'Connexion'
      fill_in 'Email', with: user.email
      fill_in 'Mot de passe', with: user.password
      click_button 'Connexion'
      expect(current_path).to eq new_profile_path
      expect(page).not_to have_content 'Administration'
      visit rails_admin.dashboard_path
      expect(page).to have_content 'Oups. Désolez vous ne pouvez pas accéder à cette ressource'
      click_link 'Déconnexion'
    end
  end
end
