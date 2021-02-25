class FavsController < ApplicationController

    def create
        @fav = Fav.new()
        @user = current_user
        @asso = Asso.find(params[:asso_id])
        @fav.asso = @asso
        @fav.user = @user
        redirect_to assos_path if @fav.save
        authorize @fav
    end

    def destroy
        @fav = Fav.find(params[:id])
        @fav.destroy
        authorize @fav
        redirect_to assos_path
    end
end
