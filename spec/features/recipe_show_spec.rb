require 'rails_helper'

RSpec.describe 'Visit recipes show page (recipe detail)', type: :feature do
  before :each do
    @user = User.create(name: 'Nick Jhons', email: 'test@test.com', password: '123456')
    @recipe = Recipe.create(name: 'Pasta', user: @user, preparation_time: 15, cooking_time: 15,
                            description: 'description 1', public: false)
    @food1 = Food.create(name: 'Tomato', measurement_unit: 'kg', price: 1.5, quantity: 10, user: @user)
    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food1, quantity: 2)

    sign_in @user
    visit recipe_path(@recipe)
  end

  it 'Should see your name after sign in' do
    expect(page).to have_content 'Welcome Nick Jhons'
  end

  it 'Should see a Recipe details' do
    expect(page).to have_content 'Recipe name: Pasta'
    expect(page).to have_content 'Cooking time: 15'
    expect(page).to have_content 'Preparation time: 15'
    expect(page).to have_content 'Description: description 1'
  end

  it 'Should see a list of ingredients' do
    expect(page).to have_content 'Ingredients'
    expect(page).to have_content 'Tomato'
  end

  it 'Should see a actions buttons for ingredients, remove and modify' do
    expect(page).to have_content 'Actions'
    expect(page).to have_content 'Remove'
    expect(page).to have_content 'Modify'
    expect(page).to have_selector('button')
  end

  it 'When click on Remove, should remove the ingredient' do
    click_button 'Remove'
    expect(page).not_to have_content 'Tomato'
  end

  it 'When click on Modify, should redirects to a form to modify the ingredient' do
    click_button 'Modify'
    expect(page).to have_current_path(edit_recipe_food_path(@recipe_food))
  end

  it 'Should find buttons or links to Make public de recipe, for add a new ingredient, and for
      generate shoping list' do
    expect(page).to have_content 'Make Public'
    expect(page).to have_content 'Add a new ingredient'
    expect(page).to have_content 'Generate Shoping list'
  end

  it "When click on 'Make Public', should  toogle from private to public and viceverse" do
    click_button 'Make Public'
    expect(page).to have_content 'Make Private'
  end

  it "When click on 'Add a new ingredient', should redirects to a form to add a new ingredient" do
    click_link 'Add a new ingredient'
    expect(page).to have_current_path(new_recipe_food_path(recipe_id: @recipe.id))
  end

  # it "When click on 'Generate Shoping list', should redirects to a shoping list" do
  #   click_link 'Generate Shoping list'
  #   expect(page).to have_current_path(recipe_shoping_list_path(@recipe)
  # end
end
