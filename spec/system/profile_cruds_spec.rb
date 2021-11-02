require 'rails_helper'

RSpec.describe "ProfileCruds", type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user)
    user.add_role(:customer)
    visit new_user_session_path
    expect(page).to have_content 'Connexion'
    fill_in 'Email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Connexion'
    

  end

  describe 'profile creation' do
    it 'creates the profile' do
      expect(current_path).to eq new_profile_path
      expect(page).to have_content 'Nouveau(elle) Profil'
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      phone_1 = Faker::PhoneNumber.cell_phone
      fill_in 'Prénom', with: first_name
      fill_in 'Nom', with: last_name
      fill_in 'Téléphone 1', with: phone_1
      click_button 'Enregistrer ce(tte) Profil'
      expect(current_path).to eq user_root_path
      expect(page).to have_content first_name
      expect(page).to have_content last_name
      expect(page).to have_content phone_1
    end

    it 'fails to create the profile if fields are not filled' do
      expect(current_path).to eq new_profile_path
      expect(page).to have_content 'Nouveau(elle) Profil'
      click_button 'Enregistrer ce(tte) Profil'
      expect(current_path).to eq create_profile_path
      expect(page).to have_content "Impossible d'enregistrer ce(tte) Profil : 3 erreurs"
      expect(page).to have_content "Prénom doit être rempli(e)"
      expect(page).to have_content "Nom doit être rempli(e)"
      expect(page).to have_content "Téléphone 1 doit être rempli(e)"
    end

  end

  describe "profile edition" do
    before(:each) do
      expect(current_path).to eq new_profile_path
      expect(page).to have_content 'Nouveau(elle) Profil'
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      phone_1 = Faker::PhoneNumber.cell_phone
      fill_in 'Prénom', with: first_name
      fill_in 'Nom', with: last_name
      fill_in 'Téléphone 1', with: phone_1
      click_button 'Enregistrer ce(tte) Profil'
      expect(current_path).to eq user_root_path
      expect(page).to have_content first_name
      expect(page).to have_content last_name
      expect(page).to have_content phone_1
    end
    it 'update the profile' do
      click_link 'Modifier'
      expect(page).to have_content 'Modifier'
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      phone_1 = Faker::PhoneNumber.cell_phone
      fill_in 'Prénom', with: first_name
      fill_in 'Nom', with: last_name
      fill_in 'Téléphone 1', with: phone_1
      click_button 'Enregistrer ce(tte) Profil'
      expect(current_path).to eq user_root_path
      expect(page).to have_content first_name
      expect(page).to have_content last_name
      expect(page).to have_content phone_1
    end

    it 'fails to update the profile' do
      click_link 'Modifier'
      expect(page).to have_content 'Modifier'
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      phone_1 = Faker::PhoneNumber.cell_phone
      
      click_button 'Enregistrer ce(tte) Profil'
      expect(current_path).to eq user_root_path
      expect(page).to have_text "Profil sauvegardé(e)"
      expect(page).not_to have_text first_name
      expect(page).not_to have_text last_name
      expect(page).not_to have_text phone_1
    end
  end
end
