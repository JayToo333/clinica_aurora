class HomeController < ApplicationController
  def index
    @specialties = Specialty.all
  end
end
