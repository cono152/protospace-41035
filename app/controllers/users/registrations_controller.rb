module Users
  class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, if: :devise_controller?

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    end
  end
end