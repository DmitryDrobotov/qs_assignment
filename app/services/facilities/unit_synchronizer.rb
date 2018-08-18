module Facilities
  class UnitSynchronizer
    def initialize(facility)
      @facility = facility
    end

    def sync
      return if unit_list.nil?

      Unit.transaction do
        unit_list.each do |unit|
          @facility.units.where(name: unit).first_or_create!
        end
      end
    end

    private

    def unit_list
      return @unit_list if defined?(@unit_list)
      QuikstorClient::Operations::UnitListOperation.new(@facility).perform
    end
  end
end
