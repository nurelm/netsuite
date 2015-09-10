module NetSuite
  module Records
    class ItemFulfillmentPackageUps
      include Support::Fields
      include Support::Records
      include Namespaces::TranSales

      fields :package_weight_ups, :package_tracking_number_ups, :packaging_ups, :use_insured_value_ups, :additional_handling_ups, :use_cod_ups, :delivery_conf_ups

      def initialize(attributes_or_record = {})
        case attributes_or_record
        when Hash
          initialize_from_attributes_hash(attributes_or_record)
        when self.class
          initialize_from_record(attributes_or_record)
        end
      end

      def initialize_from_record(record)
        self.attributes = record.send(:attributes)
      end
    end
  end
end
