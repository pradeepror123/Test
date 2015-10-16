class Doctors::BaseController < ApplicationController
  before_filter :authorize
  
end