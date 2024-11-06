module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_up_params, only: [:create]

    protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
  end
end