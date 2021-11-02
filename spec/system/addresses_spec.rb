require 'rails_helper'

RSpec.describe "Addresses", type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user)
    user.add_role(:customer)
    FactoryBot.create(:profile, user: user)
    visit new_user_session_path
    expect(page).to have_content 'Connexion'
    fill_in 'Email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Connexion'
  end

  describe 'creation and reading' do
    it 'creates the address' do
      expect(current_path).to eq user_root_path
      expect(page).to have_content 'Adresses'
      click_link('Adresses', match: :first)
      expect(page).to have_content 'Adresses'
      expect(current_path).to eq addresses_path
      click_link 'Créer un(e) Adresse'
      expect(current_path).to eq new_address_path
      expect(page).to have_content 'Nouveau(elle) Adresse'
      name = Faker::Name.name
      last_name = Faker::Name.last_name
      line_1 = Faker::Address.full_address 
      line_2 = Faker::Address.full_address 
      country = Faker::Address.country
      city = Faker::Address.city
      zip = Faker::Address.zip
      fill_in 'Nom', with: name
      fill_in 'Ligne 1', with: line_1
      fill_in 'Ligne 2', with: line_2
      fill_in 'Pays', with: country
      fill_in 'Ville', with: city
      fill_in 'Code postal', with: zip
      click_button 'Enregistrer ce(tte) Adresse'      
      expect(page).to have_content "Adresse créé(e)"
      expect(page).to have_content name
      expect(page).to have_content line_1
      expect(page).to have_content line_2
      expect(page).to have_content country
      expect(page).to have_content city
      expect(page).to have_content zip
    end
  

  end

  
end
