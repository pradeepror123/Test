module Doctors
  class DashboardController < BaseController

    before_filter :set_role
    before_filter :find_doctor, only: %w(edit destroy update)
    helper_method :customers

    def appointments
      @appointments = my_appointments
    end

    def edit_appointment
      @appointment = my_appointments.find params[:id]
    end

    def update_appointment
      @appointment = my_appointments.find params[:id]
      @appointment.update_attributes appointment_params
      redirect_to "/doctors/my_appointments"
    end

    def create
      @doctor = @doctor_role.users.new(doctors_params)
      if @doctor.save
        redirect_to doctors_root_path
      else
        @doctor.build_profile
        render :new
      end
    end

    def destroy
      @doctor.destroy
      redirect_to doctors_root_path
    end

    def index
      @doctors = @doctor_role.users
    end

    def new
      @doctor = @doctor_role.users.new
      @doctor.build_profile
    end

    def update
      @doctor.update_attributes doctors_params
      redirect_to doctors_root_path
    end

    protected

      def customers
        role = Role.find_by_name("customer")
        @customers = role.users
      end

      def my_appointments
        @appointments ||= Appointment.where(:doctor_id => current_user.id )
      end

      def set_role
        @doctor_role ||= Role.find_by_name("doctor")
      end

      def find_doctor
        @doctor ||= @doctor_role.users.find params[:id]
      end

      def appointment_params
        params.require(:appointment).permit(:pet_name, :type_of_pet, :breed, :weight, :date_of_last_visit, :age)
      end

      def doctors_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation, :role_id, :address, :city, :state, :zip)
      end
  end
end