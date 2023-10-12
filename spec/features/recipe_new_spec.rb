require 'rails_helper'

RSpec.describe 'New Recipe page', type: :feature do
  before :each do
    @user = User.create(name: 'User name', email: 'email@test.com', password: 'password123')

    sign_in @user
    visit new_recipe_path
  end

  scenario 'User creates a new recipe' do
    fill_in 'Name', with: 'My new recipe'
    fill_in 'Description', with: 'My new recipe description'
    fill_in 'Preparation time', with: '10'
    fill_in 'Cooking time', with: '20'
    click_button 'Create Recipe'
    expect(page).to have_content('Recipe created successfully')
  end
end
