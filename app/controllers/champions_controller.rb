class ChampionsController < ApplicationController
  def index
  end

  def show
    @champion_name = params[:id]
  end
end
