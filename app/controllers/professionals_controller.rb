class ProfessionalsController < ApplicationController
  def index
    if params[:specialty_id].present?
      @professionals = Professional.where(specialty_id: params[:specialty_id], active: true)
    end
  end
end
