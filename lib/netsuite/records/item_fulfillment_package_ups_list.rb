module NetSuite
  module Records
    class ItemFulfillmentPackageUpsList
      include Support::Fields
      include Support::Records
      include Namespaces::TranSales

      fields :package_ups

      def initialize(attributes = {})
        if attributes.keys != [:package_ups] && attributes.first

          transformed_attrs = {}
          object = attributes.first.last

          case object
          when Hash
            object.each do |k, v|
              transformed_attrs.merge!(k[0..-5].to_sym => v)
            end
          when Array
            object.each do |hash|
              hash.each do |k, v|
                transformed_attrs.merge!(k[0..-5].to_sym => v)
              end
            end
          end

          attributes = { package_ups: transformed_attrs }
        end

        initialize_from_attributes_hash(attributes)
      end

      def package_ups=(packages_ups)
        case packages_ups
        when Hash
          self.packages_ups << ItemFulfillmentPackageUps.new(packages_ups)
        when Array
          packages_ups.each { |package_ups| self.packages_ups << ItemFulfillmentPackageUps.new(package_ups) }
        end
      end

      def packages_ups
        @packages_ups ||= []
      end

      def to_record
        { "#{record_namespace}:package_ups" => packages_ups.map(&:to_record) }
      end
    end
  end
end
