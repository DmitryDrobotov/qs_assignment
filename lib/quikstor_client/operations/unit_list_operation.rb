module QuikstorClient
  module Operations
    class UnitListOperation < ::QuikstorClient::BaseOperation
      def method_name
        :unit_list
      end

      def perform(options = {})
        super do |response|
          response[:string]
        end
      end
    end
  end
end
