class SiteController < ApplicationController

  before_action :set_locale

  def index
    locale =  params[:locale]

    if locale.present?
      I18n.locale = locale || I18n.default_locale
      cookies[:locale] = locale
    end
  end
end
