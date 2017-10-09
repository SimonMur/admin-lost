class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
def create
    if self.resource.failed_attempts != self.resource.class.maximum_attempts - 1 and self.resource.failed_attempts != 0
        attempts_left = self.resource.failed_attempts
        flash[:alert] = I18n.t 'some_path.errors.attempts', attempts_left: attempts_left
   
end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
