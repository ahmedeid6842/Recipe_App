require 'rails_helper'

RSpec.describe 'Visit Public recipes index', type: :feature do
  before :each do
    @user = User.create(name: 'User name', email: 'user@mail.com', password: 'password123')
    @recipe1 = Recipe.create(name: 'My new recipe', user: @user, preparation_time: 15, cooking_time: 15, description:
                            'description 1', public: true)
    @recipe2 = Recipe.create(name: 'My new recipe 2', user: @user, preparation_time: 15, cooking_time: 15, description:
                            'description 2', public: false)
    @recipe3 = Recipe.create(name: 'My new recipe 3', user: @user, preparation_time: 15, cooking_time: 15, description:
                            'description 3', public: true)

    sign_in @user
  end

  scenario 'User visits public recipes index' do
    visit public_recipes_path
    expect(page).to have_content('My new recipe')
    expect(page).to have_content('My new recipe 3')
    expect(page).not_to have_content('My new recipe 2')
  end
end
