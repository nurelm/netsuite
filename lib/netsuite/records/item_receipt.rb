module NetSuite
  module Records
    class ItemReceipt
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranPurch

      actions :get, :add, :initialize, :delete, :search

      fields :tran_date, :tran_id, :memo, :created_date, :currency_name, :last_modified_date,
               :exchange_rate, :landed_cost_per_line

      read_only_fields :handling_cost

      record_refs :custom_form, :entity, :created_from, :currency, :partner, :posting_period, :subsidiary

      field :item_list,                ItemReceiptItemList
      field :custom_field_list,        CustomFieldList

      attr_reader   :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)

        initialize_from_attributes_hash(attributes)
      end

      def to_record
        rec = super
        if rec["#{record_namespace}:customFieldList"]
          rec["#{record_namespace}:customFieldList!"] = rec.delete("#{record_namespace}:customFieldList")
        end
        rec
      end

      def self.search_class_name
        "Transaction"
      end

    end
  end
end