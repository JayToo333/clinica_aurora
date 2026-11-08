class HomeController < ApplicationController
  allow_unauthenticated_access
  
  def index
    @specialties = Specialty.where(active: true)
  end
end
