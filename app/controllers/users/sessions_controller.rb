# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :check_if_admin, only: [:create]

  private

  def check_if_admin
    user = User.find_by(email: params[:user][:email])
    if user && !user.admin?
      redirect_to root_path, alert: 'Access restricted to admins only.'
    end
  end
end
