class ProfessionalsController < ApplicationController
  allow_unauthenticated_access only: [ :index ]

  def index
    @professionals = Professional.where(
      specialty_id: params[:specialty_id],
      active: true
    )
  end

  def show
    @professional = Professional.find_by!(
      id: params[:id],
      active: true
    )
  end
end
