class DashboardsController < ApplicationController
  def profile
    authorize(:dashboard, :profile?)
    @assos = current_user.assos
    @latitude = params[:latitude]
    @longitude = params[:longitude]

    @markers = @assos.geocoded.map do |asso|
      {
        lat: asso.latitude,
        lng: asso.longitude,
        infoWindow: render_to_string(partial: "info_window", formats: :html, locals: { asso: asso })
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: { cards: render_to_string(partial: "cards", formats: :html) } }
    end
  end
end
