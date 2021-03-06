class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: [:index, :results], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :results], unless: :skip_pundit?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^searchs$)/
  end
end
