class Ability < ApplicationRecord
  has_many :character_abilities
  has_many :characters, through: :character_abilities
  has_many :battles, through: :character_abilities

  def slug_name
    self.name.split('_').collect { |word| word.capitalize }.join(' ')
  end

end
