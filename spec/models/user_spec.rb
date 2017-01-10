require_relative '../rails_helper'

describe User do

  context 'validations' do

    let(:user) { User.new(username: 'ericschwartz', password_digest: '1234') }
    let(:invalid_user) { User.new }

    it 'is valid with a username and a password' do
      expect(user).to be_valid
    end
    it 'is invalid without a username' do
      invalid_user.valid?
      expect(invalid_user.errors.full_messages).to include("Username can't be blank")
    end
    it 'is invalid without a password' do
      invalid_user.valid?
      expect(invalid_user.errors.full_messages).to include("Password can't be blank")
    end

  end

end
