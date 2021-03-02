class FavsController < ApplicationController

  def create
    @fav = Fav.new()
    @user = current_user
    @asso = Asso.find(params[:asso_id])
    @fav.asso = @asso
    @fav.user = @user
    authorize @fav
    @fav.save
  end

  def destroy
    @fav = Fav.find(params[:id])
    authorize @fav
    @fav.destroy
  end
end