class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #delegate :current_user, :user_signed_in?, to: :user_session
  #helper_method :current_user, :user_signed_in?

  protect_from_forgery with: :exception




  include WelcomeHelper
  include LogsHelper


=begin
  def require_authentication
    unless user_signed_in?
      redirect_to new_user_sessions_path,
                  alert: "Você precisa estar logado para continuar"
    end
  end

  def require_no_authentication
    if user_signed_in?
      redirect_to root_path,
                  notice: "Você já está logado."
    end
  end

  def user_session
    UserSession.new(session)
  end

=end



end
