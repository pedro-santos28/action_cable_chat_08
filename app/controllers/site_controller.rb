class SiteController < ApplicationController

  before_action :set_locale

  def index
    locale = Language.find_by(abbreviation: params[:locale])

    if locale.present?
      I18n.locale = locale[:abbreviation] || I18n.default_locale
      cookies[:locale] = locale[:abbreviation]
    end
  end
end
