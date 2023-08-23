class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def after_sign_in_path_for(resource)
      if resource.is_a?(User) && !resource.income.present?
        new_income_path
      else
        # Default behavior for sign in
        super
      end
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :email])
    end
end
