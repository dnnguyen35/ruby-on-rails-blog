# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_update_params, only: [:update_resource]

  def change_avatar
    @user = current_user
    if (params[:user].present? && params[:user][:avatar].present?)
      @user.avatar.purge_later if @user.avatar.attached?
      @user.skip_password_validation = true
      @user.update_without_password(avatar: params[:user][:avatar])
      redirect_to user_path(@user)
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(password_params)
      bypass_sign_in(@user)
      redirect_to user_path(@user)
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

  def update_resource(resource, params)
    resource.skip_password_validation = true
    resource.update_without_password(params)
  end

  protected

  def after_update_path_for(resource)
    if is_default_avatar(resource)
      resource.avatar.purge_later
      init_default_avatar(resource)
    end
    user_path(current_user)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    init_default_avatar(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def init_default_avatar(user)
    short_name = [user.first_name[0], user.last_name[0]].join.upcase

    avatar = MiniMagick::Image.open(Rails.root.join('app', 'assets', 'images', 'avatar-bg.jpg'))
    avatar.combine_options do |a|
      a.fill 'blue'
      a.gravity 'center'
      a.pointsize 30
      a.annotate '0,0', short_name
    end

    avatar_name = "#{user.model_name.human}_#{user.id}.jpg"
    avatar_path = Rails.root.join('tmp',avatar_name)
    avatar.write(avatar_path)

    user.avatar.attach(io: File.open(avatar_path), filename: avatar_name)
    File.delete(avatar_path)
  end  

  def is_default_avatar(user)
    avatar_filename = "#{user.model_name.human}_#{user.id}.jpg"

    if user.avatar.attached?
      user_avatar_filename = user.avatar.filename.to_s
    end

    if user_avatar_filename.eql?(avatar_filename)
      return true
    else
      return false
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end
