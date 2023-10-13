require 'rails_helper'

RSpec.describe 'Visit food index page', type: :feature do
  before :each do
    @user = User.create(name: 'User name', email: 'email@test.com', password: '123456')
    @food1 = Food.create(name: 'Food name 1', user: @user, quantity: 10, measurement_unit: 'kg', price: 10.0)
    @food2 = Food.create(name: 'Food name 2', user: @user, quantity: 12, measurement_unit: 'kg', price: 12.0)
    @food3 = Food.create(name: 'Food name 3', user: @user, quantity: 14, measurement_unit: 'kg', price: 14.0)

    sign_in @user
    visit foods_path
  end

  it 'Should render a list of foods' do
    expect(page).to have_content('Foods List')
    expect(page).to have_content('Food name 1')
    expect(page).to have_content('Food name 2')
    expect(page).to have_content('Food name 3')
  end

  it 'Should find buttons "Delete" and "Add food"' do
    expect(page).to have_content('Delete')
    expect(page).to have_content('Add Food')
  end

  it 'When click on "Delete", should remove the food' do
    click_button 'Delete', match: :first
    expect(page).not_to have_content('Food name 1')
  end

  it 'When click on "Add food", should redirects to a form to add a new food' do
    click_link 'Add Food'
    expect(page).to have_current_path(new_food_path)
  end
end
