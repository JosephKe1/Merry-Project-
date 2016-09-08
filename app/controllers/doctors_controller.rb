class DoctorsController < ApplicationController
  layout 'doctor'

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new doctor_params

  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :phone_number,
                                   :specialty,
                                   :address,
                                   :city,
                                   :province,
                                   :postal_code,
                                   :clinic)

  end

end
