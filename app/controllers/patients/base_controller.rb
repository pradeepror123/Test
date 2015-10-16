class Patients::BaseController < ApplicationController
  before_filter :authorize
  
end