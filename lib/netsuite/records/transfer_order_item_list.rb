module NetSuite
  module Records
    class TransferOrderItemList
      include Support::Fields
      include Namespaces::TranInvt

      fields :item

      def initialize(attributes = {})
        initialize_from_attributes_hash(attributes)
      end

      def item=(items)
        case items
        when Hash
          self.items << TransferOrderItem.new(items)
        when Array
          items.each { |item| self.items << TransferOrderItem.new(item) }
        end
      end

      def items
        @items ||= []
      end

      def to_record
        { "#{record_namespace}:item" => items.map(&:to_record) }
      end

    end
  end
end