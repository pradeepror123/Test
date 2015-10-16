class User < ActiveRecord::Base
  has_secure_password

  belongs_to :role
  has_many :appointments
  has_one :profile
  accepts_nested_attributes_for :profile

  validates :name, length: {maximum: 35 }, presence: true
  validates :zip, length: {maximum: 5 }, allow_blank: true
  validates :username, presence: true, uniqueness: true

  def doctor?
    role.name == "doctor"
  end

  def receptionist?
    role.name == "receptionist"
  end

  def customer?
    role.name == "customer"
  end
end
