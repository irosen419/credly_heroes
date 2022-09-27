class HerosController < ApplicationController
  include HerosHelper
  include BadgesHelper

  # Retrieve HEROES from MARVEL API
  def index
    @heroes = get_heroes()
  end

  def show
    @hero = get_hero(params[:id])
    @templates = get_templates()
    @badges = get_badges("#{params[:id]}@gmail.com")["data"]
  end

  def find_hero
    hero = query_hero(params["hero"])
    redirect_to hero_path(hero["id"])
  end

  private

  def search_params
    params.require(:hero).permit(:id, :name, :thumbnail)
  end
end