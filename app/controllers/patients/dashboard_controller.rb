module Patients
  class DashboardController < BaseController
    def index
      @appointments = Appointment.where(:customer_id => current_user.id)
    end
  end
end