class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
    @patient_profile = PatientProfile.new
  end

  def create
    @user = User.new(user_params)
    @patient_profile = PatientProfile.new(patient_profile_params)
    
    if saved(@user, @patient_profile)
      start_new_session_for(@user)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def registration_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :phone,
      :birth_date
    )
  end

  
  def user_params
    registration_params.slice(
      :email,
      :password,
      :password_confirmation
  )
  end
  
  def patient_profile_params
    registration_params.slice(
      :name,
      :email,
      :phone,
      :birth_date
    )
  end

  def saved(user, patient_profile)
    if user.save
      patient_profile.user_id = user.id

      unless patient_profile.save
        user.destroy
        
        return false
      end
    
      return true
    else
      return false
    end
  end
end