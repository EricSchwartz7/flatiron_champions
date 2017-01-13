class EvolutionController < ApplicationController
  # before_action :require_evolution

  def new
    @characters = Character.list_characters
  end

  def create
    @characters = Character.list_characters
    evolution = params[:character]

    new_character = []
    @characters.each {|char| new_character << char if char.char_type == evolution}
    characters = current_user.characters.where(char_type: 'student')

    if characters.count == 1
      @character = characters.first
    else
      characters.each do |character|
        @character = character if character.xp >= 50
      end
    end

    @character.char_type = new_character.first.char_type
    @character.picture_front = new_character.first.picture_front
    @character.save

    @character.abilities << Ability.where(char_type: new_character.first.char_type)



    redirect_to "/evolution/#{@character.id}"
  end

  def show

  end


end
