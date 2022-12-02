require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'karam Fouad', email: 'karam@gmail.com', password: '123123',
             password_confirmation: '123123')
  end

  before { subject.save }

  context 'Test user validations' do
    it 'is a user with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'email should be an string' do
      expect(subject.email).to be_a_kind_of(String)
    end
  end
end
