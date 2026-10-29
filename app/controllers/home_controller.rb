class HomeController < ApplicationController
  def index
    @specialties = Specialty.where(active: true)
  end
end
