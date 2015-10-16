module Receptionists
  class DashboardController < BaseController

    before_filter :doctors
    before_filter :customers
    before_filter :find_appointment, only: %w(edit update destroy)

    def create
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to receptionists_root_path
      else
        render :new
      end
    end

    def destroy
      @appointment.destroy
      redirect_to receptionists_root_path
    end

    def edit
    end

    def index
      @appointments = Appointment.all
    end

    def new
      @appointment = Appointment.new
    end

    def update
      if @appointment.update_attributes appointment_params
        redirect_to receptionists_root_path
      else
        render :edit
      end
    end

    protected

      def find_appointment
        @appointment ||= Appointment.find params[:id]
      end


      def customers
        role = Role.find_by_name("customer")
        @customers = role.users
      end

      def doctors
        role = Role.find_by_name("doctor")
        @doctors = role.users
      end

      def appointment_params
        params.require(:appointment).permit(:customer_id, :doctor_id, :pet, :reminder_required, :reason_for_visit, :date_of_visit)
      end
  end
end