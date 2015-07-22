module NetSuite
  module Records
    class PurchaseOrder
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranPurch

      actions :get, :add, :initialize, :delete, :update, :upsert, :search

      fields :created_date, :last_modified_date, :tran_date, :tran_id, :to_be_emailed, :to_be_faxed,
        :to_be_printed, :fax, :bill_address, :status, :due_date, :supervisor_approval

      field :transaction_ship_address, ShipAddress
      field :transaction_bill_address, BillAddress
      field :item_list,                PurchaseOrderItemList
      field :custom_field_list,        CustomFieldList

      read_only_fields :total

      record_refs :custom_form, :entity, :terms, :bill_address_list, :location, :employee

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
