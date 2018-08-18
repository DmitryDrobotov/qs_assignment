module Facilities
  class InsuranceSynchronizer
    def initialize(facility)
      @facility = facility
    end

    def sync
      return if available_insurance.nil?

      Insurance.transaction do
        available_insurance.each do |insurance|
          @facility.insurances.where(insurance).first_or_create!
        end
      end
    end

    private

    def available_insurance
      return @available_insurance if defined?(@available_insurance)
      QuikstorClient::Operations::AvailableInsuranceOperation.new(@facility).perform
    end
  end
end
