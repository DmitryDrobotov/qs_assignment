class SynchronizationsController < ApplicationController
  def new
    @facility = Facility.find(params[:facility_id])

    sync_insurance
    sync_unit

    redirect_to facilities_path
  end

  private

  def sync_insurance
    result = Facilities::InsuranceSynchronizer.new(@facility).sync
    flash[:error] = 'Insurance sync failed.' if result.nil?
  end

  def sync_unit
    result = Facilities::UnitSynchronizer.new(@facility).sync
    flash[:error] = 'Unit sync failed.' if result.nil?
  end
end
