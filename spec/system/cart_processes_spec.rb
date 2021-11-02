require 'rails_helper'

RSpec.describe "CartProcesses", type: :system do
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

  describe 'categories and subcategories' do
    it 'go to categories page' do
      expect(current_path).to eq user_root_path
      category = FactoryBot.create(:category)
      subcategory = FactoryBot.create(:subcategory, category: category)
      visit categories_path
      expect(page).to have_text "Catégories"
      expect(page).to have_text category.name
      click_link(category.name.first, :match => :first)
      expect(page).to have_text category.name
      expect(current_path).to eq category_path(category.slug)
      

    end

    it 'go to subcategories page' do
      expect(current_path).to eq user_root_path
      category = FactoryBot.create(:category)
      subcategory = FactoryBot.create(:subcategory, category: category)
      visit subcategory_path(category.slug,subcategory.slug)
      expect(page).to have_text "Produits"
      expect(page).to have_text subcategory.name
    end
  end

  describe 'product page and cart' do
    before(:each) do
      expect(current_path).to eq user_root_path
      category = FactoryBot.create(:category)
      subcategory = FactoryBot.create(:subcategory, category: category)
    end

  end
  
end
