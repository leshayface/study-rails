class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.friendly.includes(:gameplays).find(params[:id])
    @gameplays = @game.gameplays.paginate(:page => params[:page])
  end

end
