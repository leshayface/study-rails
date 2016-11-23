class HomeController < ApplicationController

  def index
    @highlights = Highlight.homepage.all
    @features = Gameplay.all.includes(:member).order("created_at DESC").limit(3)
  end
end
