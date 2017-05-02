class CharacterAttributeController < ApplicationController
  
  def create
    @character_attribute = Character.find_by(id: )
  end
  
  private
  def character_attribute_params
    params.require(:character_attribute).permit(:ability_score, :ability_modifer)
  end
end
