class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
    
    def configure_permitted_parameters
      # 新規登録時にnameのストロングパラメータを追加(取得を許可)
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # サインイン時にnameとimageのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :image])
      # アカウント編集時にnameとprofileとimageのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :image ])
    end
  
  
  end
