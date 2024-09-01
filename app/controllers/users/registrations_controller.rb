# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    render :edit
  end

  def create
    super do |resource|
      resource.role = Role.find_by(role_name: "User")
      resource.save
    end
  end

  protected

  def after_update_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end
end
