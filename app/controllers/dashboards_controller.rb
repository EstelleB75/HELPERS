class DashboardsController < ApplicationController
  def profile
    authorize(:dashboard, :profile?)
    @assos = current_user.assos

    @markers = @assos.geocoded.map do |asso|
      {
        lat: asso.latitude,
        lng: asso.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { asso: asso })
      }
    end
  end
end
