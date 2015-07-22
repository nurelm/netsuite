module NetSuite
  module Records
    class PurchaseOrderItem
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Namespaces::TranPurch

      fields :amount, :description, :expected_receipt_date, :gross_amt, :is_billable, :is_closed, :match_bill_to_receipt, :line, :quantity, :quantity_available, :quantity_billed, :quantity_on_hand, :quantity_received, :serial_numbers, :rate, :tax1_amt,  :tax_rate1, :tax_rate2, :vendor_name

      field :custom_field_list, CustomFieldList

      record_refs :customer, :department, :item, :klass, :location, :tax_code, :units

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

      def to_record
        rec = super
        if rec["#{record_namespace}:customFieldList"]
          rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
        end
        rec
      end
    end
  end
end
