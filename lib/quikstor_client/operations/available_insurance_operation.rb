module QuikstorClient
  module Operations
    class AvailableInsuranceOperation < ::QuikstorClient::BaseOperation
      def method_name
        :available_insurance
      end

      def perform(options = {})
        super do |response|
          response[:available_insurance_st]
        end
      end
    end
  end
end
