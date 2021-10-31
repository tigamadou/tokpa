require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations tests' do
    context 'success ' do
      it 'creates the user if name email and password are provided' do
        task = User.new(email: 'user@user.com',password: '123456')
        expect(task).to be_valid
      end
    end

    context 'fails' do

     

      it 'when email is not provided' do
        task = User.new( password: '123456')
        expect(task).not_to be_valid
      end

      it 'when password is not provided' do
        task = User.new( email: 'user@user.com')
        expect(task).not_to be_valid
      end

      it 'when password is less than 6 chars' do
        task = User.new( email: 'user@user.com', password: '123')
        expect(task).not_to be_valid
      end
    end

  end
end
