# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_in_params, only: [:create]
  def edit
    render :edit
  end

  protected

  def after_update_path_for(resource)
    orders_path
  end
end
