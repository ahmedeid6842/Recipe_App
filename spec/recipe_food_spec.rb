require 'rails_helper'
RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Nick Jhons', email: 'test@test.com', password: '123456')
    @food = Food.create(name: 'Tomato', measurement_unit: 'kg', price: 1.5, quantity: 10, user: @user)
  end
  describe 'Validations' do
    it 'Should be valid with a name, measurement_unit, price, quantity' do
      expect(@food).to be_valid
    end
    it 'Should be invalid without a name' do
      food = Food.create(name: '', measurement_unit: 'kg', price: 1.5, quantity: 10, user: @user)
      expect(food).not_to be_valid
    end
    it 'Should be invalid if quantity is not a number greater or equal t0 0' do
      food = Food.create(name: 'tomato', measurement_unit: 'kg', price: 1.5, quantity: -10, user: @user)
      expect(food).not_to be_valid
    end
    it 'Should be invalid if price is not a number greater or equal to 0' do
      food = Food.create(name: 'tomato', measurement_unit: 'kg', price: -1.5, quantity: 10, user: @user)
      expect(food).not_to be_valid
    end
  end
end
