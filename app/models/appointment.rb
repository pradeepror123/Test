class Appointment < ActiveRecord::Base
  belongs_to :doctor, class_name: "User", foreign_key: 'doctor_id'
  belongs_to :customer, class_name: "User", foreign_key: 'customer_id'
  validates :pet, presence: true
  validates :customer, presence: true
  validates  :doctor, presence: true
  validates :reason_for_visit, presence: true

  validate :should_not_past_date_appointment

  def should_not_past_date_appointment
    if self.date_of_visit.past?
      errors.add(:date_of_visit, 'should not be in past')
    end
  end
end
