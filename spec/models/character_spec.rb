require_relative '../rails_helper'

describe Character do

  context 'validations' do

    let(:character) { Character.new(char_type: 'student', user_id: 1) }
    let(:invalid_character) { Character.new }

    it 'is valid with a char_type and a user_id' do
      expect(character).to be_valid
    end

    it 'is invalid without a char_type, user_id' do
      invalid_character.valid?
      expect(invalid_character.errors.full_messages).to include('Character can't be blank')
    end

    it 'has a default level of 1' do
      expect(character.level).to eq(1)
    end

    it 'has a default hp of 100' do
      expect(character.hp).to eq(100)
    end

  end

end
