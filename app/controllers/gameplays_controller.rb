class GameplaysController < ApplicationController

  before_action :authenticate_member!, except: [:show]

  def new
    @gameplay = Gameplay.new
  end

  def create
    @gameplay = Gameplay.new(gameplay_params)
    @gameplay.member_id = current_member.id

    respond_to do |format|
      if @gameplay.save
        format.html { redirect_to @gameplay, notice: 'Gameplay successfully created' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @gameplay = Gameplay.friendly.find(params[:id])
    ensure_current_member_is_owner
  end


  def update
    @gameplay = Gameplay.friendly.find(params[:id])
    ensure_current_member_is_owner
    respond_to do |format|
      if @gameplay.update(gameplay_params)
        format.html { redirect_to @gameplay, notice: 'Gameplay was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def show
    @gameplay = Gameplay.friendly.includes(:game,:member,:comments).find(params[:id])
  end


  def destroy
    @gameplay = Gameplay.friendly.find(params[:id])
    ensure_current_member_is_owner
    @gameplay.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Gameplay was successfully destroyed.' }
    end
  end

private

  def ensure_current_member_is_owner
    redirect_to :back unless current_member.id == @gameplay.member_id
  end

  def gameplay_params
    params.require(:gameplay).permit(:title, :link,:description, :game_id)
  end

end
