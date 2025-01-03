class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth
  skip_before_action :authenticate_user!, only: [:guest_sign_in]

  def guest_sign_in
    # ゲストユーザーを作成または取得
    guest_user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "Guest User"
    end
    # Deviseのsign_inメソッドでゲストユーザーをサインイン
    sign_in guest_user
    # ログイン後のリダイレクト
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end
  #
end
