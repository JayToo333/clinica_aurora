class ProfessionalsController < ApplicationController
  def index
    @professionals = Professional.all

    if params.value?(:specialty_id)
      @professionals = professional.where(specialty_id: params[:specialty_id], active: true)
    end
  end
end
